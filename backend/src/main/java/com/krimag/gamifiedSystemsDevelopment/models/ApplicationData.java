package com.krimag.gamifiedSystemsDevelopment.models;

public class ApplicationData {
    private Long id;
    private String applicationDomain;
    private String ageGroup;
    private String disorders;
    private String gamificationGoal;

    public ApplicationData() {}
    public ApplicationData(String applicationDomain, String ageGroup, String disorders, String gamificationGoal) {
        this.applicationDomain = applicationDomain;
        this.ageGroup = ageGroup;
        this.disorders = disorders;
        this.gamificationGoal = gamificationGoal;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getApplicationDomain() {
        return applicationDomain;
    }

    public void setApplicationDomain(String applicationDomain) {
        this.applicationDomain = applicationDomain;
    }

    public String getAgeGroup() {
        return ageGroup;
    }

    public void setAgeGroup(String ageGroup) {
        this.ageGroup = ageGroup;
    }

    public String getDisorders() {
        return disorders;
    }

    public void setDisorders(String disorders) {
        this.disorders = disorders;
    }

    public String getGamificationGoal() {
        return gamificationGoal;
    }

    public void setGamificationGoal(String gamificationGoal) {
        this.gamificationGoal = gamificationGoal;
    }
}
