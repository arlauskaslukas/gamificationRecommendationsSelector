import React, { useState, useEffect } from "react";
import Button from "../Button/Button";
import Pagination from "../Pagination/Pagination";
import RecommendationItemCard from "../RecommendationItemCard/RecommendationItemCard";
import { Criteria } from "@/app/types/types";

interface Props {
  criteria: Criteria;
}

const DEFAULT_PAGE_SIZE = 10;

export default function GeneralisedRecommendationsSection({ criteria }: Props) {
  const [recommendations, setRecommendations] = useState<any[]>([]);
  const [loading, setLoading] = useState(false);
  const [page, setPage] = useState(1);
  const [error, setError] = useState<string | null>(null);

  const fetchData = async () => {
    setLoading(true);
    console.log("Fetching data with criteria:", criteria);
    setError(null);
    try {
      const res = await fetch("/api/generalised-recommendations", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify(criteria),
      });
      if (!res.ok) throw new Error(`API error ${res.status}`);
      const data = await res.json();
      setRecommendations(data);
      setPage(1); // reset to first page on new search
    } catch (err: any) {
      console.error(err);
      setError(err.message || "Unknown error");
    } finally {
      setLoading(false);
    }
  };

  // Optional: re‑fetch automatically when criteria change

  const start = (page - 1) * DEFAULT_PAGE_SIZE;
  const current = recommendations.slice(start, start + DEFAULT_PAGE_SIZE);

  return (
    <div className="px-2 py-4 w-full bg-gray-200">
      <div className="flex px-2 flex-row justify-between items-center">
        <h2 className="text-lg font-semibold text-gray-800">
          Generalised Recommendations{" "}
          {recommendations.length > 0 && `(${recommendations.length})`}
        </h2>
        <Button
          label="Determine recommendations"
          onClick={fetchData}
          disabled={loading}
        />
      </div>

      {error && <p className="text-red-600 p-4">{error}</p>}

      {loading && <p className="p-4">Loading…</p>}

      {!loading && current.length === 0 && (
        <p className="p-4">No recommendations match your criteria.</p>
      )}

      {/* Recommendation list */}
      <div className="pt-10 flex flex-col gap-4">
        {current.map((item, idx) => (
          <RecommendationItemCard
            key={`${item.ruleIdx}`}
            title={item.genRecommendation}
            index={item.ruleIdx}
            ageGroup={item.ageGroup}
            domain={item.applicationDomain}
            disorder={item.disorder}
            usabilityCharacteristic={item.usabilityPrinciple}
            usabilityGoal={item.usabilityGoal}
            gamificationGoal={item.gamificationGoal}
            example={item.example}
          />
        ))}
      </div>

      {/* Pagination */}
      {recommendations.length > DEFAULT_PAGE_SIZE && (
        <div className="pt-4 flex justify-center">
          <Pagination
            pages={Math.ceil(recommendations.length / DEFAULT_PAGE_SIZE)}
            currentPage={page}
            onChangeCurrentPage={setPage}
          />
        </div>
      )}
    </div>
  );
}
