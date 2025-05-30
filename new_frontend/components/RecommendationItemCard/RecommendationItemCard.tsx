"use client";
import { useState } from "react";
import SelectMark from "../SelectMark/SelectMark";
import { RecommendationStatus } from "@prisma/client";
import RecStatusMark from "../RecStatusMark/RecStatusMark";

type RecommendationItemCardProps = {
  id: number;
  title: string;
  index: number;
  ageGroup: string;
  domain: string;
  disorder: string;
  usabilityCharacteristic: string;
  usabilityGoal: string;
  gamificationGoal?: string;
  example: string;
  status: RecommendationStatus;
  onClick: (id: number, status: RecommendationStatus) => void;
};

export default function RecommendationItemCard({
  id,
  title,
  index,
  ageGroup,
  domain,
  disorder,
  usabilityCharacteristic,
  usabilityGoal,
  gamificationGoal,
  example,
  status,
  onClick,
}: RecommendationItemCardProps) {
  return (
    <div key={index} className="w-full bg-white text-black py-2 pb-6 px-4">
      <div className="font-bold text-xl flex flex-row justify-between">
        <h3>
          #{index + 1} {title}
        </h3>
      </div>
      <div className="grid grid-cols-2 pt-2">
        <div className="w-full">
          <div className="flex flex-row items-start text-sm">
            <p className="font-bold">Age group:&nbsp;</p>
            <p>{ageGroup}</p>
          </div>
          <div className="flex flex-row items-start text-sm">
            <p className="font-bold">Application domain:&nbsp;</p>
            <p>{domain}</p>
          </div>
          <div className="flex flex-row items-start text-sm">
            <p className="font-bold">Disorder:&nbsp;</p>
            <p>{disorder}</p>
          </div>
        </div>
        <div className="w-full">
          <div className="flex flex-row items-start text-sm">
            <p className="font-bold">Usability characteristic:&nbsp;</p>
            <p>{usabilityCharacteristic}</p>
          </div>
          <div className="flex flex-row items-start text-sm">
            <p className="font-bold">Usability goal:&nbsp;</p>
            <p>{usabilityGoal}</p>
          </div>
          <div className="flex flex-row items-start text-sm">
            <p className="font-bold">Gamification goal:&nbsp;</p>
            <p>{gamificationGoal}</p>
          </div>
        </div>
      </div>
      <div className="flex flex-row text-[16px]">
        <p className="font-bold">Example:&nbsp;</p>
        <p>{example}</p>
      </div>
      <div className="flex flex-row gap-4">
        <RecStatusMark
          selected={status == RecommendationStatus.NON_FIT}
          value={RecommendationStatus.NON_FIT}
          onClick={(value: RecommendationStatus) => {
            onClick(id, value);
          }}
        />
        <RecStatusMark
          selected={status == RecommendationStatus.PARTIAL_FIT}
          value={RecommendationStatus.PARTIAL_FIT}
          onClick={(value: RecommendationStatus) => {
            onClick(id, value);
          }}
        />
        <RecStatusMark
          selected={status == RecommendationStatus.FIT}
          value={RecommendationStatus.FIT}
          onClick={(value: RecommendationStatus) => {
            onClick(id, value);
          }}
        />
      </div>
    </div>
  );
}
