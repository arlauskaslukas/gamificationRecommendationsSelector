package com.krimag.gamifiedSystemsDevelopment.controllers;

import com.krimag.gamifiedSystemsDevelopment.models.GamificationElementsInput;
import com.krimag.gamifiedSystemsDevelopment.models.GeneralisedRecommendationsInput;
import io.camunda.zeebe.client.ZeebeClient;
import io.camunda.zeebe.client.api.response.ProcessInstanceResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/elements")
public class DetermineGamificationElements {
    private final ZeebeClient zeebeClient;

    public DetermineGamificationElements(ZeebeClient zeebeClient) {
        this.zeebeClient = zeebeClient;
    }

    @SuppressWarnings("unchecked")
    @PostMapping
    public Map<String, Object> determineGamificationElements(@RequestBody GamificationElementsInput input) {
        Map<String, Object> variables = Map.of(
                "usabilityGoal", input.getUsabilityGoals(),
                "usabilityCharacteristic", input.getUsabilityCharacteristics(),
                "ageGroup", input.getAgeGroups(),
                "applicationDomain", input.getApplicationDomains(),
                "disorder", input.getDisorders(),
                "gamificationGoal", input.getGamificationGoals()
        );
        ProcessInstanceResult suitableResult = zeebeClient.newCreateInstanceCommand()
                .bpmnProcessId("Process_06chpyv").latestVersion().variables(variables).withResult().send().join();
        ProcessInstanceResult notSuitableResult = zeebeClient.newCreateInstanceCommand()
                .bpmnProcessId("Process_1uqsdzc").latestVersion().variables(variables).withResult().send().join();

        List<Map<String, Object>> suitableElements = (List<Map<String, Object>>) suitableResult.getVariablesAsMap().get("gamificationElement");
        List<String> notSuitable = (List<String>) notSuitableResult.getVariablesAsMap().get("notSuitableGamificationElement");
        List<Map<String, Object>> filtered = suitableElements.stream()
                .filter(elem -> {
                    String name = (String) elem.get("gamificationElement");
                    return !notSuitable.contains(name);
                })
                .toList();
        Map<String, Object> finalOutput = new HashMap<>();
        finalOutput.put("suitableElements", filtered);
        return finalOutput;
    }
}
