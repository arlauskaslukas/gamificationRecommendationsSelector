"use client";

import { useEffect, useState } from "react";
import { useParams } from "next/navigation";
import RecommendationItemCard from "@/components/RecommendationItemCard/RecommendationItemCard";
import ButtonPillToggle from "@/components/ButtonPillToggle/ButtonPillToggle";
import RecommendationElementCard from "@/components/RecommendationElementCard/RecommendationElementCard";
import {
  RecommendationStatus,
  SavedGeneralisedRecommendation,
  SavedNotSuitableGamificationElements,
  SavedSuitableGamificationElements,
  SavedUsabilityRecommendationsForGamificationElementsIso,
  SavedUsabilityRecommendationsForGamificationElementsWcag22,
} from "@prisma/client";
import AccordionItem from "@/components/Accordion/Accordion";

export default function SavedResultPage() {
  const { id } = useParams();
  const [data, setData] = useState<any>(null);
  const [error, setError] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);

  const fetchData = async () => {
    try {
      const res = await fetch(`/api/saved-result/${id}`, {
        method: "POST",
      });

      if (!res.ok) {
        const errorData = await res.json();
        throw new Error(errorData.error || "Unknown error");
      }

      const result = await res.json();
      console.log(result);
      setData(result);
    } catch (err: any) {
      console.error(err);
      setError(err.message);
    } finally {
      setLoading(false);
    }
  };

  const refetch = async () => {
    const res = await fetch(`/api/saved-result/${id}`, {
      method: "POST",
    });

    if (!res.ok) {
      const errorData = await res.json();
      throw new Error(errorData.error || "Unknown error");
    }

    const result = await res.json();
    setData(result);
  };

  const handleGeneralisedRecommendationChange = async (
    gid: number,
    status: RecommendationStatus
  ) => {
    await fetch(`/api/saved-result/${id}/generalised/${gid}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        status: status,
      }),
    }).then((res) => {
      refetch();
    });
  };

  const handleIsoRecommendationChange = async (
    gid: number,
    status: RecommendationStatus
  ) => {
    await fetch(`/api/saved-result/${id}/iso/${gid}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        status: status,
      }),
    }).then((res) => {
      refetch();
    });
  };

  const handleWcagRecommendationChange = async (
    gid: number,
    status: RecommendationStatus
  ) => {
    await fetch(`/api/saved-result/${id}/wcag/${gid}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        status: status,
      }),
    }).then((res) => {
      refetch();
    });
  };

  const getGeneralisedRecommendationsQuantities = () => {
    let nonFit = data.SavedGeneralisedRecommendation.filter(
      (rec: SavedGeneralisedRecommendation) =>
        rec.selectionStatus === RecommendationStatus.NON_FIT
    ).length;
    let partialFit = data.SavedGeneralisedRecommendation.filter(
      (rec: SavedGeneralisedRecommendation) =>
        rec.selectionStatus === RecommendationStatus.PARTIAL_FIT
    ).length;
    let fit = data.SavedGeneralisedRecommendation.filter(
      (rec: SavedGeneralisedRecommendation) =>
        rec.selectionStatus === RecommendationStatus.FIT
    ).length;
    return `(Fit - ${fit}, Partial Fit - ${partialFit}, Non fit - ${nonFit}).`;
  };

  const getSuitableElementsQuantity = () => {
    let selected = data.SavedSuitableGamificationElements.filter(
      (el: SavedSuitableGamificationElements) => el.selected
    ).length;
    let total = data.SavedSuitableGamificationElements.length;
    return `(Selected ${selected}/${total}).`;
  };

  const getNotSuitableElementsQuantity = () => {
    let selected = data.SavedNotSuitableGamificationElements.filter(
      (el: SavedNotSuitableGamificationElements) => el.selected
    ).length;
    let total = data.SavedNotSuitableGamificationElements.length;
    return `(Selected ${selected}/${total}).`;
  };

  const getIsoRecommendationsQuantities = () => {
    let nonFit =
      data.SavedUsabilityRecommendationsForGamificationElementsIso.filter(
        (rec: SavedUsabilityRecommendationsForGamificationElementsIso) =>
          rec.selectionStatus === RecommendationStatus.NON_FIT
      ).length;
    let partialFit =
      data.SavedUsabilityRecommendationsForGamificationElementsIso.filter(
        (rec: SavedUsabilityRecommendationsForGamificationElementsIso) =>
          rec.selectionStatus === RecommendationStatus.PARTIAL_FIT
      ).length;
    let fit =
      data.SavedUsabilityRecommendationsForGamificationElementsIso.filter(
        (rec: SavedUsabilityRecommendationsForGamificationElementsIso) =>
          rec.selectionStatus === RecommendationStatus.FIT
      ).length;
    return `(Fit - ${fit}, Partial Fit - ${partialFit}, Non fit - ${nonFit}).`;
  };

  const getWcagRecommendationsQuantities = () => {
    let nonFit =
      data.SavedUsabilityRecommendationsForGamificationElementsWcag22.filter(
        (rec: SavedUsabilityRecommendationsForGamificationElementsWcag22) =>
          rec.selectionStatus === RecommendationStatus.NON_FIT
      ).length;
    let partialFit =
      data.SavedUsabilityRecommendationsForGamificationElementsWcag22.filter(
        (rec: SavedUsabilityRecommendationsForGamificationElementsWcag22) =>
          rec.selectionStatus === RecommendationStatus.PARTIAL_FIT
      ).length;
    let fit =
      data.SavedUsabilityRecommendationsForGamificationElementsWcag22.filter(
        (rec: SavedUsabilityRecommendationsForGamificationElementsWcag22) =>
          rec.selectionStatus === RecommendationStatus.FIT
      ).length;
    return `(Fit - ${fit}, Partial Fit - ${partialFit}, Non fit - ${nonFit}).`;
  };

  const handleElementsChange = async (gid: number, status: boolean) => {
    await fetch(`/api/saved-result/${id}/elements/${gid}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        status: status,
      }),
    }).then((res) => {
      refetch();
    });
  };
  const handleNotSuitableElementsChange = async (
    gid: number,
    status: boolean
  ) => {
    await fetch(`/api/saved-result/${id}/non-elements/${gid}`, {
      method: "POST",
      headers: { "Content-Type": "application/json" },
      body: JSON.stringify({
        status: status,
      }),
    }).then((res) => {
      refetch();
    });
  };

  useEffect(() => {
    if (!id) return;

    fetchData();
  }, [id]);

  if (loading) return <div className="p-6 text-gray-700">Loading...</div>;
  if (error) return <div className="p-6 text-red-600">Error: {error}</div>;
  return (
    <div className="p-6 mx-auto">
      <h1 className="text-2xl font-bold mb-4 text-black">
        Website: {data?.name}
      </h1>

      <div className="mb-6">
        <h2 className="text-xl font-semibold text-black">
          {`Generalised Recommendations ${getGeneralisedRecommendationsQuantities()}`}
        </h2>
        <div className="">
          <AccordionItem title="Generalised Recommendations">
            {data?.SavedGeneralisedRecommendation?.map((item: any) => (
              <RecommendationItemCard
                id={item.generalisedRecommendation.id}
                key={`${item.generalisedRecommendation.ruleIdx}`}
                title={item.generalisedRecommendation.genRecommendation}
                index={item.generalisedRecommendation.ruleIdx}
                ageGroup={item.generalisedRecommendation.ageGroup}
                domain={item.generalisedRecommendation.applicationDomain}
                disorder={item.generalisedRecommendation.disorder}
                usabilityCharacteristic={
                  item.generalisedRecommendation.usabilityPrinciple
                }
                usabilityGoal={item.generalisedRecommendation.usabilityGoal}
                gamificationGoal={
                  item.generalisedRecommendation.gamificationGoal
                }
                example={item.generalisedRecommendation.example}
                status={item.selectionStatus}
                onClick={(id, value) => {
                  handleGeneralisedRecommendationChange(id, value);
                }}
              />
            ))}
          </AccordionItem>
        </div>
      </div>

      <div className="mb-6">
        <h2 className="text-xl font-semibold text-black">
          {`Suitable Gamification Elements ${getSuitableElementsQuantity()}`}
        </h2>
        <AccordionItem title="Suitable Gamification Elements">
          <div className="flex flex-row flex-wrap px-2 gap-4 pt-6">
            {data.SavedSuitableGamificationElements.map(
              (element: any, index: number) => (
                <ButtonPillToggle
                  key={index}
                  selected={element.selected}
                  notSuitable={false}
                  label={
                    element.suitableGamificationElements.gamificationElement
                  }
                  onClick={() => {
                    handleElementsChange(
                      element.suitableGamificationElementsId,
                      !element.selected
                    );
                  }}
                />
              )
            )}
          </div>
        </AccordionItem>
      </div>

      <div className="mb-6">
        <h2 className="text-xl font-semibold text-black">
          {`Not Suitable Gamification Elements ${getNotSuitableElementsQuantity()}`}
        </h2>
        <AccordionItem title="Not Suitable Gamification Elements">
          <div className="flex flex-row flex-wrap px-2 gap-4 pt-6">
            {data.SavedNotSuitableGamificationElements.map(
              (element: any, index: number) => (
                <ButtonPillToggle
                  key={index}
                  selected={element.selected}
                  notSuitable={true}
                  label={
                    element.notSuitableGamificationElements
                      .notSuitableGamificationElement
                  }
                  onClick={() => {
                    handleNotSuitableElementsChange(
                      element.notSuitableGamificationElementsId,
                      !element.selected
                    );
                  }}
                />
              )
            )}
          </div>
        </AccordionItem>
      </div>

      <div className="mb-6">
        <h2 className="text-xl font-semibold text-black">
          {`Usability Recommendations (ISO) ${getIsoRecommendationsQuantities()}`}
        </h2>
        <div className="flex flex-col gap-4">
          <AccordionItem title="Usability Recommendations (ISO)">
            {data.SavedUsabilityRecommendationsForGamificationElementsIso.map(
              (item: any) => (
                <RecommendationElementCard
                  key={
                    item.usabilityRecommendationsForGamificationElementsIso.id
                  }
                  status={item.selectionStatus}
                  onClick={(value: RecommendationStatus) => {
                    handleIsoRecommendationChange(
                      item.usabilityRecommendationsForGamificationElementsIsoId,
                      value
                    );
                  }}
                  title={
                    item.usabilityRecommendationsForGamificationElementsIso
                      .elementUsabilityRecommendation ?? ""
                  }
                  index={
                    item.usabilityRecommendationsForGamificationElementsIso
                      .ruleIdx
                  }
                  example={
                    item.usabilityRecommendationsForGamificationElementsIso
                      .example ?? ""
                  }
                  recommendationName={
                    item.usabilityRecommendationsForGamificationElementsIso
                      .isoRecommendation
                  }
                />
              )
            )}
          </AccordionItem>
        </div>
      </div>

      <div>
        <h2 className="text-xl font-semibold text-black">
          {`Usability Recommendations (WCAG 2.2) ${getWcagRecommendationsQuantities()}`}
        </h2>
        <div className="flex flex-col gap-4">
          <AccordionItem title="Usability Recommendations (WCAG 2.2)">
            {data.SavedUsabilityRecommendationsForGamificationElementsWcag22.map(
              (item: any) => (
                <RecommendationElementCard
                  key={
                    item.usabilityRecommendationsForGamificationElementsWcag22
                      .id
                  }
                  status={item.selectionStatus}
                  onClick={(value: RecommendationStatus) => {
                    handleWcagRecommendationChange(
                      item.usabilityRecommendationsForGamificationElementsIsoId,
                      value
                    );
                  }}
                  title={
                    item.usabilityRecommendationsForGamificationElementsWcag22
                      .elementUsabilityRecommendation ?? ""
                  }
                  index={
                    item.usabilityRecommendationsForGamificationElementsWcag22
                      .ruleIdx
                  }
                  example={
                    item.usabilityRecommendationsForGamificationElementsWcag22
                      .example ?? ""
                  }
                  recommendationName={
                    item.usabilityRecommendationsForGamificationElementsWcag22
                      .wcagRecommendation
                  }
                />
              )
            )}
          </AccordionItem>
        </div>
      </div>
    </div>
  );
}
