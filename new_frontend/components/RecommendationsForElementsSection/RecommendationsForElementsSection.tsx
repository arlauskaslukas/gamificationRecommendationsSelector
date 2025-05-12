"use client";
import {
  Criteria,
  ElementsRecResponse,
  ElementsResponse,
  ElementsType,
} from "@/app/types/types";
import AccordionItem from "../Accordion/Accordion";
import Button from "../Button/Button";
import ButtonPillToggle from "../ButtonPillToggle/ButtonPillToggle";
import RecommendationElementCard from "../RecommendationElementCard/RecommendationElementCard";
import { useState } from "react";
import { fetchGamificationElements } from "@/app/lib/api/fetchGamificationElements";
import { fetchElementRecommendations } from "@/app/lib/api/fetchRecommendationsForElements";

interface Props {
  criteria: Criteria;
}

export default function RecommendationsForElementsSection({ criteria }: Props) {
  const [elements, setElements] = useState<ElementsType>({
    suitable: [],
    notSuitable: [],
    other: [],
  });
  const [recommendations, setRecommendations] = useState<ElementsRecResponse>(
    []
  ); // TODO: Define the type for recommendations
  const [elementsLoaded, setElementsLoaded] = useState(false);
  const [recommendationsLoaded, setRecommendationsLoaded] = useState(false);
  const getElements = async () => {
    setElementsLoaded(false);
    await fetchGamificationElements(criteria).then((res) => {
      console.log(res);
      if (res) {
        let suitable = res.suitable.map((element) => ({
          name: element,
          selected: true,
        }));
        let notSuitable = res.notSuitable.map((element) => ({
          name: element,
          selected: false,
        }));
        let other = res.other.map((element) => ({
          name: element,
          selected: false,
        }));
        setElements({
          suitable: suitable,
          notSuitable: notSuitable,
          other: other,
        });
        setElementsLoaded(true);
      }
    });
  };
  const getRecommendationsForElements = async () => {
    setRecommendationsLoaded(false);
    const chosenNames = [
      ...elements.suitable.filter((x) => x.selected).map((x) => x.name),

      ...elements.notSuitable.filter((x) => x.selected).map((x) => x.name),

      ...elements.other.filter((x) => x.selected).map((x) => x.name),
    ];
    await fetchElementRecommendations({
      disorders: criteria.disorder,
      elements: chosenNames,
    }).then((res) => {
      console.log(res);
      if (res) {
        setRecommendations(res);
        setRecommendationsLoaded(true);
      }
    });
  };
  const handleSelect = (listKey: keyof ElementsType, index: number) => {
    setElements((prevElements) => ({
      ...prevElements,
      [listKey]: prevElements[listKey].map((element, i) =>
        i === index ? { ...element, selected: !element.selected } : element
      ),
    }));
  };
  return (
    <div className="px-2 py-4 w-full bg-gray-200">
      <div className="flex px-2 flex-row justify-between items-center">
        <h2 className="text-lg font-semibold text-gray-800">
          Suitable gamification elements{" "}
          {elementsLoaded && `(${elements.suitable.length})`}
        </h2>
        <Button
          label="Determine gamification elements"
          onClick={async () => {
            await getElements();
          }}
        />
      </div>
      <div className="flex flex-row flex-wrap px-2 gap-4 pt-6">
        {elements.suitable.map((element, index) => (
          <ButtonPillToggle
            key={index}
            selected={element.selected}
            notSuitable={false}
            label={element.name}
            onClick={() => {
              handleSelect("suitable", index);
            }}
          />
        ))}
      </div>
      <div className="pt-6 px-2">
        <h2 className="text-lg font-semibold text-gray-800">
          Other gamification elements{" "}
          {elementsLoaded &&
            `(${
              elements.other.filter((element) => element.selected).length
            } selected) (Total: ${elements.other.length})`}
        </h2>
      </div>
      <div className="flex flex-row flex-wrap px-2 gap-4 pt-6">
        {elements.other.map((element, index) => (
          <ButtonPillToggle
            key={index}
            selected={element.selected}
            notSuitable={false}
            label={element.name}
            onClick={() => {
              handleSelect("other", index);
            }}
          />
        ))}
        {elements.notSuitable.map((element, index) => (
          <ButtonPillToggle
            key={index}
            selected={element.selected}
            notSuitable={true}
            label={element.name}
            onClick={() => {
              handleSelect("notSuitable", index);
            }}
          />
        ))}
      </div>
      <div className="flex px-2 pt-6 flex-row justify-between items-center">
        <h2 className="text-lg font-semibold text-gray-800">
          Recommendations for gamification elements{" "}
          {recommendationsLoaded &&
            `(${
              recommendations
                .map((element) => element.recommendations.flat())
                .flat().length
            })`}
        </h2>
        <Button
          label="Determine recommendations for gamification elements"
          onClick={async () => {
            await getRecommendationsForElements();
          }}
        />
      </div>
      <div className="flex flex-col gap-4">
        {recommendations.map((rec, index) => (
          <AccordionItem key={index} title={rec.element}>
            {rec.recommendations.map((recommendation, index) => (
              <RecommendationElementCard
                key={index}
                title={recommendation.elementUsabilityRecommendation ?? ""}
                index={index}
                example={recommendation.example ?? ""}
                recommendationName={recommendation.recommendation}
              />
            ))}
          </AccordionItem>
        ))}
      </div>
    </div>
  );
}
