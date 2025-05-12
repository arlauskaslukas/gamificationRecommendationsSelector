package com.krimag.gamifiedSystemsDevelopment.models;

import java.util.List;

public class GamificationElementsInput {
    private List<String> usabilityGoals;
    private List<String> usabilityCharacteristics;
    private List<String> ageGroups;
    private List<String> applicationDomains;
    private List<String> disorders;
    private List<String> gamificationGoals;


    public List<String> getUsabilityGoals() {
        return usabilityGoals;
    }

    public void setUsabilityGoals(List<String> usabilityGoals) {
        this.usabilityGoals = usabilityGoals;
    }

    public List<String> getUsabilityCharacteristics() {
        return usabilityCharacteristics;
    }

    public void setUsabilityCharacteristics(List<String> usabilityCharacteristics) {
        this.usabilityCharacteristics = usabilityCharacteristics;
    }
    public List<String> getAgeGroups() {
        return ageGroups;
    }
    public void setAgeGroups(List<String> ageGroups) {
        this.ageGroups = ageGroups;
    }
    public List<String> getApplicationDomains() {
        return applicationDomains;
    }
    public void setApplicationDomains(List<String> applicationDomains) {
        this.applicationDomains = applicationDomains;
    }
    public List<String> getDisorders() {
        return disorders;
    }
    public void setDisorders(List<String> disorders) {
        this.disorders = disorders;
    }
    public List<String> getGamificationGoals() {
        return gamificationGoals;
    }
    public void setGamificationGoals(List<String> gamificationGoals) {
        this.gamificationGoals = gamificationGoals;
    }
}
