"use client";
import {
  Criteria,
  ElementRec,
  ElementSelectionStatus,
  ElementsRecResponse,
  ElementsResponse,
  ElementsType,
  RecommendationSavedType,
  RecRow,
} from "@/app/types/types";
import AccordionItem from "../Accordion/Accordion";
import Button from "../Button/Button";
import ButtonPillToggle from "../ButtonPillToggle/ButtonPillToggle";
import RecommendationElementCard from "../RecommendationElementCard/RecommendationElementCard";
import { Dispatch, SetStateAction, useEffect, useState } from "react";
import { fetchGamificationElements } from "@/app/lib/api/fetchGamificationElements";
import { fetchElementRecommendations } from "@/app/lib/api/fetchRecommendationsForElements";
import { RecommendationStatus } from "@prisma/client";
import RecStatusMark from "../RecStatusMark/RecStatusMark";
import RuleMetadataInteractiveCard from "../ElementMetadataCard/ElementMetadataCard";
import RuleMetadataInteractiveCardMain from "../ElementMetadataCard/ElementMetadataCardMain";

interface Props {
  criteria: Criteria;
  backproppedElements: (elements: ElementsType) => void;
  selectedElements?: ElementSelectionStatus[];
  selectedUnusableElements?: ElementSelectionStatus[];
  selectedISORecommendations: RecommendationSavedType[];
  selectedWCAGRecommendations: RecommendationSavedType[];
  selectedUnusableElementsHandler: (elements: ElementsType) => void;
  selectedSpecificRecommendationsHandler: (
    isoRecommendations: RecommendationSavedType[],
    wcagRecommendations: RecommendationSavedType[]
  ) => void;
  elements: ElementsType;
  setElements: Dispatch<SetStateAction<ElementsType>>;
  recommendations: ElementsRecResponse;
  setRecommendations: Dispatch<SetStateAction<ElementsRecResponse>>;
  elementUsabilityStatuses: Record<number, RecommendationStatus | null>;
  handleElementUsabilityStatusChange: (
    elementId: number,
    status: RecommendationStatus | null
  ) => void;
  handleUsabilityElementsFetch: () => Promise<void>;
  elementRec: ElementRec;
}

export default function RecommendationsForElementsSection({
  criteria,
  backproppedElements,
  selectedElements,
  selectedUnusableElements,
  selectedISORecommendations,
  selectedWCAGRecommendations,
  selectedUnusableElementsHandler,
  selectedSpecificRecommendationsHandler,
  elements,
  setElements,
  recommendations,
  setRecommendations,
  elementUsabilityStatuses,
  handleElementUsabilityStatusChange,
  handleUsabilityElementsFetch,
  elementRec,
}: Props) {
  const [elementsLoaded, setElementsLoaded] = useState(false);
  const [recommendationsLoaded, setRecommendationsLoaded] = useState(false);
  const getElements = async () => {
    setElementsLoaded(false);
    await fetchGamificationElements(criteria).then((res) => {
      console.log(res);
      if (res) {
        let suitable = res.suitable.map((element) => ({
          element: element,
          selected: true,
        }));
        let notSuitable = res.notSuitable.map((element) => ({
          element: element,
          selected: false,
        }));
        let other = res.other.map((element) => ({
          element: element,
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
  const getItemSelectionStatus = (rec: RecRow) => {
    return rec.recommendation.includes("ISO")
      ? selectedISORecommendations?.find((item) => item.id === rec.id)
          ?.status ?? null
      : selectedWCAGRecommendations?.find((item) => item.id === rec.id)
          ?.status ?? null;
  };
  const handleRecommendationSelect = (
    rec: RecRow,
    status: RecommendationStatus
  ) => {
    if (rec.recommendation.includes("ISO")) {
      let iso = selectedISORecommendations.map((r) =>
        r.id == rec.id ? { ...r, status } : r
      );
      selectedSpecificRecommendationsHandler(iso, selectedWCAGRecommendations);
    } else {
      let wcag = selectedWCAGRecommendations.map((r) =>
        r.id == rec.id ? { ...r, status } : r
      );
      selectedSpecificRecommendationsHandler(selectedISORecommendations, wcag);
    }
  };

  const getRecommendationsForElements = async () => {
    setRecommendationsLoaded(false);
    const chosenNames = [
      ...elements.suitable
        .filter((x) => x.selected)
        .map((x) => x.element.gamificationElement),

      ...elements.notSuitable
        .filter((x) => x.selected)
        .map((x) => x.element.gamificationElement),

      ...elements.other
        .filter((x) => x.selected)
        .map((x) => x.element.gamificationElement),
    ];
    await fetchElementRecommendations({
      disorders: criteria.disorder,
      elements: chosenNames,
    }).then((res) => {
      console.log(res);
      let iso: RecommendationSavedType[] = [];
      let wcag: RecommendationSavedType[] = [];
      let elementRecomendations: Record<number, RecommendationStatus | null> =
        {};
      res.forEach((el) => {
        iso = [
          ...iso,
          ...el.recommendations
            .filter((row) => row.recommendation.includes("ISO"))
            .map((r) => ({
              id: r.id,
              status: null,
            })),
        ];
        wcag = [
          ...wcag,
          ...el.recommendations
            .filter((row) => !row.recommendation.includes("ISO"))
            .map((r) => ({
              id: r.id,
              status: null,
            })),
        ];
      });
      res.forEach((el) => {
        el.usabilityRecommendations.forEach((r) => {
          handleElementUsabilityStatusChange(r.id, null);
        });
      });
      selectedSpecificRecommendationsHandler(iso, wcag);

      if (res) {
        setRecommendations(res);
        setRecommendationsLoaded(true);
      }
    });
  };

  const handleElementUsabilityFetch = async () => {
    await handleUsabilityElementsFetch();
  };

  const handleSelect = (listKey: keyof ElementsType, index: number) => {
    setElements((prevElements) => ({
      ...prevElements,
      [listKey]: prevElements[listKey].map((element, i) =>
        i === index ? { ...element, selected: !element.selected } : element
      ),
    }));
  };

  const handleUnusedElementsSelect = (index: number) => {
    handleSelect("notSuitable", index);
    selectedUnusableElementsHandler(elements);
  };

  useEffect(() => {
    backproppedElements(elements);
  }, [elements]);

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
            label={element.element.gamificationElement}
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
            label={element.element.gamificationElement}
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
            label={element.element.gamificationElement}
            onClick={() => {
              handleUnusedElementsSelect(element.element.id);
            }}
          />
        ))}
      </div>
      <div className="flex px-2 pt-6 flex-row justify-between items-center">
        <h2 className="text-lg font-semibold text-gray-800">
          ISO and WCAG recommendations for gamification elements{" "}
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
            <div className="py-3">
              <p className="font-bold mb-1">Usability recommendations:</p>
              <table className="text-sm w-full">
                <thead>
                  <tr>
                    <th className="text-left">Recommendation</th>
                    <th className="text-left">Status</th>
                  </tr>
                </thead>
                <tbody>
                  {rec.usabilityRecommendations.map((ur) => (
                    <tr className="border" key={ur.id}>
                      <td>{ur.recommendation}</td>
                      <td className="space-x-2">
                        {Object.values(RecommendationStatus).map((status) => (
                          <RecStatusMark
                            key={status}
                            selected={elementUsabilityStatuses[ur.id] == status}
                            value={status}
                            onClick={(value: RecommendationStatus) => {
                              handleElementUsabilityStatusChange(ur.id, value);
                            }}
                          />
                        ))}
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
            {rec.recommendations.map((recommendation, index) => (
              <RecommendationElementCard
                key={index}
                status={getItemSelectionStatus(recommendation)}
                onClick={(value: RecommendationStatus) => {
                  handleRecommendationSelect(recommendation, value);
                  console.log(getItemSelectionStatus(recommendation));
                }}
                title={recommendation.elementUsabilityRecommendation ?? ""}
                index={index}
                example={recommendation.example ?? ""}
                recommendationName={recommendation.recommendation}
              />
            ))}
          </AccordionItem>
        ))}
      </div>
      <div className="my-6">
        <div className="flex flex-row justify-between items-center px-2">
          <h2 className="text-lg font-semibold text-gray-800">
            Element usability recommendations{" "}
            {elementRec && `(${elementRec.length})`}
          </h2>
          <Button
            label="Determine element usability recommendations"
            onClick={async () => {
              await handleElementUsabilityFetch();
            }}
          />
        </div>

        <div className="flex flex-col gap-4">
          {elementRec &&
            elementRec.map((item, idx: any) => {
              console.log(item.data);
              return (
                <AccordionItem title={item.element} key={idx}>
                  <div className="grid grid-cols-2 gap-4">
                    {item?.data.map((entry, index: number) => {
                      return (
                        <RuleMetadataInteractiveCardMain
                          props={entry.data}
                          selectionStatus={elementUsabilityStatuses[entry.id]}
                          key={entry.id}
                          onStatusChange={(
                            id: number,
                            status: RecommendationStatus
                          ) => {
                            handleElementUsabilityStatusChange(id, status);
                          }}
                        />
                      );
                    })}
                  </div>
                </AccordionItem>
              );
            })}
        </div>
      </div>
    </div>
  );
}
