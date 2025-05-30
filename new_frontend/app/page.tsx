"use client";
import InputForm from "@/components/InputForm/InputForm";
import OutputSpace from "@/components/OutputSpace/OutputSpace";
import {
  Criteria,
  ElementsRecResponse,
  ElementsType,
  RecRow,
  SavedResultType,
} from "./types/types";
import { useState } from "react";
import SaveSection from "@/components/SaveSection/SaveSection";
import { RecommendationStatus } from "@prisma/client";

type RecommendationSavedType = {
  id: number;
  status?: RecommendationStatus;
};

type ElementSelectionStatus = {
  id: number;
  status: boolean;
};

export default function Home() {
  const [criteria, setCriteria] = useState<Criteria>({
    usabilityGoal: [],
    ageGroup: [],
    disorder: [],
    applicationDomain: [],
    usabilityPrinciple: [],
    gamificationGoal: [],
  });
  const [recommendations, setRecommendations] = useState<any[]>([]);

  const [elements, setElements] = useState<ElementsType>({
    suitable: [],
    notSuitable: [],
    other: [],
  });
  const [isoWcagRecs, setIsoWcagRecs] = useState<ElementsRecResponse>([]);
  const [generalisedRecommendations, setGeneralisedRecommendations] = useState<
    RecommendationSavedType[]
  >([]);
  const [selectedElements, setSelectedElements] = useState<
    ElementSelectionStatus[]
  >([]);
  const [selectedUnusableElements, setSelectedUnusableElements] = useState<
    ElementSelectionStatus[]
  >([]);
  const [selectedISORecommendations, setselectedISORecommendations] = useState<
    RecommendationSavedType[]
  >([]);
  const [selectedWCAGRecommendations, setSelectedWCAGRecommendations] =
    useState<RecommendationSavedType[]>([]);

  const [websiteName, setWebsiteName] = useState<string>("");

  const [success, setSuccess] = useState<boolean>(false);

  const selectedElementsHandler = (elements: ElementsType) => {
    const selected = [
      ...elements.suitable.map((element) => ({
        id: element.element.id,
        status: element.selected,
      })),
      ...elements.other.map((element) => ({
        id: element.element.id,
        status: element.selected,
      })),
    ];
    setSelectedElements(selected);
  };

  const generalisedRecommendationsHandler = (
    recommendations: RecommendationSavedType[]
  ) => {
    setGeneralisedRecommendations(recommendations);
  };

  const specificRecommendationsHandler = (
    isoRecommendations: RecommendationSavedType[],
    wcagRecommendations: RecommendationSavedType[]
  ) => {
    setselectedISORecommendations(isoRecommendations);
    setSelectedWCAGRecommendations(wcagRecommendations);
  };

  const selectedUnusableElementsHandle = (elements: ElementsType) => {
    const selected = [
      ...elements.notSuitable.map((element) => ({
        id: element.element.id,
        status: element.selected,
      })),
    ];
    setSelectedUnusableElements(selected);
  };

  const onChangeWebsiteName = (name: string) => {
    setWebsiteName(name);
  };

  const handleSave = () => {
    let input: SavedResultType = {
      name: websiteName,
      generalisedRecommendations: generalisedRecommendations,
      elements: selectedElements,
      usabilityRecommendationsForGamificationElementsIso:
        selectedISORecommendations,
      notSuitableElements: selectedUnusableElements,
      savedUsabilityRecommendationsForGamificationElementsWcag:
        selectedWCAGRecommendations,
    };
    console.log("Input to save:", input);
    fetch("/api/saved-result/new", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify(input),
    })
      .then((response) => response.json())
      .then((data) => {
        console.log("Success:", data);
      })
      .catch((error) => {
        console.error("Error:", error);
      });
  };

  return (
    <div className="">
      <main className="container flex mx-auto flex-col items-center justify-between p-4">
        <InputForm criteria={criteria} onChange={setCriteria} />
        <SaveSection
          websiteName={websiteName}
          onChange={(name: string) => {
            onChangeWebsiteName(name);
          }}
          success={success}
          onSave={() => {
            handleSave();
            setSuccess(true);
          }}
        />
        <OutputSpace
          criteria={criteria}
          generalisedRecommendationsHandler={generalisedRecommendationsHandler}
          selectedGeneralisedRecommendations={generalisedRecommendations}
          backproppedElements={selectedElementsHandler}
          selectedElements={selectedElements}
          selectedUnusableElements={selectedUnusableElements}
          selectedISORecommendations={selectedISORecommendations}
          selectedWCAGRecommendations={selectedWCAGRecommendations}
          selectedUnusableElementsHandler={selectedUnusableElementsHandle}
          selectedSpecificRecommendationsHandler={
            specificRecommendationsHandler
          }
          fetchedRecommendations={recommendations}
          setFetchedRecommendations={setRecommendations}
          elements={elements}
          setElements={setElements}
          isoWcagRecommendations={isoWcagRecs}
          setIsoWcagRecommendations={setIsoWcagRecs}
        />
      </main>
      <footer className=""></footer>
    </div>
  );
}
