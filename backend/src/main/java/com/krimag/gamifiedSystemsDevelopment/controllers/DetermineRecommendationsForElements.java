package com.krimag.gamifiedSystemsDevelopment.controllers;

import com.krimag.gamifiedSystemsDevelopment.models.RecommendationsInput;
import io.camunda.zeebe.client.ZeebeClient;
import io.camunda.zeebe.client.api.response.ProcessInstanceResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/elements/recommendations")
public class DetermineRecommendationsForElements {
    private ZeebeClient zeebeClient;

    public DetermineRecommendationsForElements(ZeebeClient zeebeClient) {
        this.zeebeClient = zeebeClient;
    }

    @PostMapping
    public List<Map<String, Object>> determineRecommendationsForElements(@RequestBody RecommendationsInput input) {
        List<String> elements = input.getGamificationElements();
        List<String> disorders = input.getDisorders();
        List<Map<String, Object>> finalRecommendations = new ArrayList<>();
        //here should be map
        for (String element : elements) {
            //here should be logic for extracting data

            Map<String, Object> WCAGvariables = Map.of(
                    "disorder", disorders,
                    "gamificationElement", List.of(element)
            );
            Map<String, Object> ISOvariables = Map.of(
                    "gamificationElement", List.of(element)
            );
            ProcessInstanceResult isoResult = zeebeClient.newCreateInstanceCommand()
                    .bpmnProcessId("Process_0vtbr4l").latestVersion().variables(ISOvariables).withResult().send().join();
            ProcessInstanceResult wcagResult = zeebeClient.newCreateInstanceCommand()
                    .bpmnProcessId("Process_00l42rw").latestVersion().variables(WCAGvariables).withResult().send().join();

            List<Map<String, Object>> WCAGrecommendationsElement = (List<Map<String, Object>>) wcagResult.getVariablesAsMap().get("result"); // [{ WCAGrecommendation, elementUsabilityRecommendation, example }]
            List<Map<String, Object>> ISOrecommendationsElement = (List<Map<String, Object>>) isoResult.getVariablesAsMap().get("result"); // [{ ISOrecommendation, elementUsabilityRecommendation, example }]

            List<Map<String, Object>> allRecs = new ArrayList<>();

            for (Map<String, Object> rec : WCAGrecommendationsElement) {
                allRecs.add(Map.of(
                        "name", rec.get("WCAGrecommendation"),
                        "elementUsabilityRecommendation", rec.get("elementUsabilityRecommendation"),
                        "example", rec.get("example")
                ));
            }

            for (Map<String, Object> rec : ISOrecommendationsElement) {
                allRecs.add(Map.of(
                        "name", rec.get("ISOrecommendation"),
                        "elementUsabilityRecommendation", rec.get("elementUsabilityRecommendation"),
                        "example", rec.get("example")
                ));
            }
            Map<String, Object> structuredOutput = Map.of(
                    "element", element,
                    "recommendations", allRecs
            );
            finalRecommendations.add(structuredOutput);
        }
        return finalRecommendations;
    }
}
