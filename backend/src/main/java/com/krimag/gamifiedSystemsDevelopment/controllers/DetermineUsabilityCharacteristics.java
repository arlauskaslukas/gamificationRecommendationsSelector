package com.krimag.gamifiedSystemsDevelopment.controllers;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.krimag.gamifiedSystemsDevelopment.models.UsabilityCharacteristicsInput;
import io.camunda.zeebe.client.ZeebeClient;
import io.camunda.zeebe.client.api.response.ProcessInstanceResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/determineUsabilityCharacteristics")
public class DetermineUsabilityCharacteristics {
    private final String decisionUrl = "http://localhost:8080/engine-rest/decision-definition/key/usabilityCharacteristics/evaluate";

    private final ZeebeClient zeebeClient;

    public DetermineUsabilityCharacteristics(ZeebeClient zeebeClient) {
        this.zeebeClient = zeebeClient;
    }

    private Map<String, Object> createVariable(String value) {
        Map<String, Object> variable = new HashMap<>();
        variable.put("value", value);
        return variable;
    }
    private Map<String, Object> createListVariable(List<String> values) {
        Map<String, Object> variable = new HashMap<>();
        variable.put("value", values);
        variable.put("type", "Object");
        variable.put("valueInfo", Map.of(
                "objectTypeName", "java.util.List",
                "serializationDataFormat", "application/json"
        ));
        return variable;
    }

    @PostMapping
    public Map<String, Object> getUsabilityCharacteristics(@RequestBody UsabilityCharacteristicsInput request) {
        Map<String, Object> variables = Map.of(
                "usabilityGoal", request.getUsabilityGoals(), // or join them if you're matching multiple
                "ageGroup", request.getAgeGroups().get(0),
                "disorder", request.getDisorders().get(0),
                "applicationDomain", request.getApplicationDomains().get(0)
        );
        // Start process that contains a Business Rule Task (DMN call)
        ProcessInstanceResult result = zeebeClient.newCreateInstanceCommand()
                .bpmnProcessId("Process_0sqtc6j") // Must match the BPMN process ID
                .latestVersion()
                .variables(variables)
                .withResult()
                .send()
                .join();
        return result.getVariablesAsMap();
    }
}
