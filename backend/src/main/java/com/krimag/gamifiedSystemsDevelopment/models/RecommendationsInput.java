package com.krimag.gamifiedSystemsDevelopment.models;

import java.util.List;

public class RecommendationsInput {
    private List<String> disorders;
    private List<String> gamificationElements;

    public List<String> getDisorders() {
        return disorders;
    }
    public void setDisorders(List<String> disorders) {
        this.disorders = disorders;
    }
    public List<String> getGamificationElements() {
        return gamificationElements;
    }
    public void setGamificationElements(List<String> gamificationElements) {
        this.gamificationElements = gamificationElements;
    }
}
