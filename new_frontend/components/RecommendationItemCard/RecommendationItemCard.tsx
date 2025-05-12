"use client";
import { useState } from "react";

type RecommendationItemCardProps = {
  title: string;
  index: number;
  ageGroup: string;
  domain: string;
  disorder: string;
  usabilityCharacteristic: string;
  usabilityGoal: string;
  gamificationGoal?: string;
  example: string;
};

export default function RecommendationItemCard({
  title,
  index,
  ageGroup,
  domain,
  disorder,
  usabilityCharacteristic,
  usabilityGoal,
  gamificationGoal,
  example,
}: RecommendationItemCardProps) {
  return (
    <div key={index} className="w-full bg-white text-black py-2 pb-6 px-4">
      <div className="font-bold text-xl">
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
    </div>
  );
}
