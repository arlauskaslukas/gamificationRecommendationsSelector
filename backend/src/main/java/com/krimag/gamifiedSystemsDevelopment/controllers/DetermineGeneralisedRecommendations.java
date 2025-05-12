package com.krimag.gamifiedSystemsDevelopment.controllers;

import com.krimag.gamifiedSystemsDevelopment.models.GeneralisedRecommendationsInput;
import io.camunda.zeebe.client.ZeebeClient;
import io.camunda.zeebe.client.api.response.ProcessInstanceResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api/recommendations/general")
public class DetermineGeneralisedRecommendations {
    private final ZeebeClient zeebeClient;

    public DetermineGeneralisedRecommendations(ZeebeClient zeebeClient) {
        this.zeebeClient = zeebeClient;
    }

    @PostMapping
    public Map<String, Object> determineGeneralisedRecommendations(@RequestBody GeneralisedRecommendationsInput input) {
        Map<String, Object> variables = Map.of(
                "usabilityGoal", input.getUsabilityGoals(),
                "usabilityPrinciple", input.getUsabilityPrinciples(),
                "ageGroup", input.getAgeGroups(),
                "applicationDomain", input.getApplicationDomains(),
                "disorder", input.getDisorders(),
                "gamificationGoal", input.getGamificationGoals()
        );
        ProcessInstanceResult result = zeebeClient.newCreateInstanceCommand()
                .bpmnProcessId("Process_1xkmn5g").latestVersion().variables(variables).withResult().send().join();
        return result.getVariablesAsMap();
    }
}
