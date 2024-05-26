package com.krimag.gamifiedSystemsDevelopment.controllers;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.krimag.gamifiedSystemsDevelopment.models.ApplicationData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/application")
public class ApplicationDataController {
    private final RestTemplate restTemplate;

    @Autowired
    public ApplicationDataController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    private Map<String, Object> createVariable(String value) {
        Map<String, Object> variable = new HashMap<>();
        variable.put("value", value);
        return variable;
    }

    private String getNextTask(String processInstanceId) {
        String url = "http://localhost:8080/engine-rest/task?processInstanceId=" + processInstanceId;
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        ObjectMapper mapper = new ObjectMapper();
        String taskId = "";
        try {
            JsonNode jsonNode = mapper.readTree(response.getBody());
            taskId = jsonNode.get(0).get("id").asText();
        }
        catch (IOException e) {
            e.printStackTrace();
            taskId = "";
        }
        return taskId;
    }

    private boolean claimTask(String taskId) {
        String url = "http://localhost:8080/engine-rest/task?taskId=" + taskId + "/claim";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        Map<String, Object> requestBody = new HashMap<>();
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);
        requestBody.put("userId", "demo");
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        return response.getStatusCode().is2xxSuccessful();
    }

    public boolean submitTask(String taskId, ApplicationData applicationData) {
        String url = "http://localhost:8080/engine-rest/task/" + taskId + "/submit-form";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        Map<String, Object> requestBody = new HashMap<>();
        Map<String, Object> variables = new HashMap<>();
        variables.put("applicationDomain", createVariable(applicationData.getApplicationDomain()));
        variables.put("ageGroup", createVariable(applicationData.getAgeGroup()));
        variables.put("disorder", createVariable(applicationData.getDisorders()));
        variables.put("gamificationGoal", createVariable(applicationData.getGamificationGoal()));
        requestBody.put("variables", variables);
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        return response.getStatusCode().is2xxSuccessful();
    }
    public ArrayList<String> getGamificationElements(String taskId, ArrayList<String> gamificationElements) {
        String url = "http://localhost:8080/engine-rest/task/" + taskId + "/form-variables?deserializeValues=true";
        System.out.println(url);
        ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
        ObjectMapper mapper = new ObjectMapper();
        try {
            JsonNode jsonNode = mapper.readTree(response.getBody());
            Object elementsObj = jsonNode.get("gamificationElement").get("value");
            List<Map<String, String>> elements = mapper.readValue(elementsObj.toString(), new TypeReference<List<Map<String, String>>>() {});
            for (Map<String, String> element : elements) {
                if(element.containsKey("gamificationElement") &&
                        !gamificationElements.contains((String) element.get("gamificationElement"))) {
                    gamificationElements.add((String) element.get("gamificationElement"));
                }
            }
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        return gamificationElements;
    }
    @CrossOrigin(origins = "http://localhost:3000")
    @PostMapping
    public Map<String, Object> getGamificationRecommendations(@RequestBody ApplicationData applicationData) {
        ArrayList<String> recommendations = new ArrayList<>();
        String url = "http://localhost:8080/engine-rest/process-definition/key/determineGamificationElementsProcess/start";
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        Map<String, Object> requestBody = new HashMap<>();
        HttpEntity<Map<String, Object>> request = new HttpEntity<>(requestBody, headers);
        requestBody.put("variables", new HashMap<>());
        ResponseEntity<String> response = restTemplate.postForEntity(url, request, String.class);
        ObjectMapper objectMapper = new ObjectMapper();
        String processInstanceId = "";
        try {
            JsonNode jsonNode = objectMapper.readTree(response.getBody());
            String id = jsonNode.get("id").asText();
            processInstanceId = id;
        }
        catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        String taskId = getNextTask(processInstanceId);
        if(!claimTask(taskId)) {
            return null;
        }
        System.out.println("Claimed task: " + taskId);
        if(!submitTask(taskId, applicationData)) {
            return null;
        }
        taskId = getNextTask(processInstanceId);
        recommendations = getGamificationElements(taskId, recommendations);
        Map<String, Object> responseBody = new HashMap<String, Object>();
        responseBody.put("recommendations", recommendations);
        return responseBody;
    }

}
