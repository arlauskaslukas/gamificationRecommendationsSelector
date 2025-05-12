"use client";

import { useState } from "react";
import MultiSelectDropdown from "../MultiSelectDropdown/MultiSelectDropdown";
import Checklist from "../Checklist/Checklist";
import { Criteria } from "@/app/types/types";

interface Props {
  criteria: Criteria;
  onChange: (c: Criteria) => void;
}

export default function InputForm({ criteria, onChange }: Props) {
  const gamificationGoals = [
    { label: "Increase autonomy", value: "Increase autonomy" },
    { label: "Reduce stress", value: "Reduce stress" },
    {
      label: "Promote intrinsic motivation",
      value: "Promote intrinsic motivation",
    },
    { label: "Reinforce learning", value: "Reinforce learning" },
    {
      label: "Increase engagement and motivation",
      value: "Increase engagement and motivation",
    },
    {
      label: "Support different learning needs",
      value: "Support different learning needs",
    },
    { label: "Decrease distraction", value: "Decrease distraction" },
    { label: "Improve focus", value: "Improve focus" },
    { label: "Foster advancement", value: "Foster advancement" },
    { label: "To foster competition", value: "To foster competition" },
  ];

  const usabilityGoals = [
    {
      label: "Support user autonomy and control",
      value: "Support user autonomy and control",
    },
    {
      label: "Promote voluntary engagement",
      value: "Promote voluntary engagement",
    },
    {
      label: "Support learning through feedback",
      value: "Support learning through feedback",
    },
    {
      label: "Encourage through positive messaging",
      value: "Encourage through positive messaging",
    },
    { label: "Enhance accessibility", value: "Enhance accessibility" },
    { label: "Reduce memory load", value: "Reduce memory load" },
    {
      label: "Minimize extraneous cognitive load",
      value: "Minimize extraneous cognitive load",
    },
    {
      label: "Ensure aesthetic clarity and simplicity",
      value: "Ensure aesthetic clarity and simplicity",
    },
    {
      label: "Ensure good text readability",
      value: "Ensure good text readability",
    },
    { label: "Improve recognition", value: "Improve recognition" },
    {
      label: "Ensure access to help when needed",
      value: "Ensure access to help when needed",
    },
    {
      label: "Focus attention on key elements",
      value: "Focus attention on key elements",
    },
    { label: "Reduce user frustration", value: "Reduce user frustration" },
    { label: "Build trust and comfort", value: "Build trust and comfort" },
  ];
  const ageGroups = [
    { label: "Adults", value: "adults" },
    { label: "Elderly", value: "elderly" },
    { label: "Children", value: "children" },
    { label: "Teenagers", value: "teenagers" },
  ];
  const domains = [
    { label: "Driving", value: "driving" },
    { label: "Medicine (health)", value: "Medicine (health)" },
    { label: "Education", value: "education" },
    { label: "Healthy eating", value: "healthy eating" },
    { label: "Fit", value: "fit" },
  ];
  const disorders = [
    { label: "Learning difficulties", value: "learning difficulties" },
    {
      label: "Deficits in forking memory",
      value: "deficits in forking memory",
    },
    { label: "Stroke patients", value: "stroke patients" },
    {
      label: "Impairments in motor skills",
      value: "impairments in motor skills",
    },
    { label: "Cognitive disorder", value: "cognitive disorder" },
    { label: "Alzheimer", value: "alzheimer" },
    { label: "Visual impairment", value: "visual impairment" },
    { label: "Hearing impairment", value: "hearing impairment" },
  ];

  const heuristics = [
    "Visibility of system status",
    "Match between system and the real world",
    "User control and freedom",
    "Consistency and standards",
    "Error prevention",
    "Recognition rather than recall",
    "Flexibility and efficiency of use",
    "Aesthetic and minimalist design",
    "Help users recognize, diagnose, and recover from errors",
    "Help and documentation",
  ];
  const ISOprinciples = [
    "Appropriateness recognizability",
    "Learnability",
    "Operability",
    "User error protection",
    "User interface aesthetics",
  ];
  const setField = (field: keyof Criteria) => (arr: string[]) => {
    onChange({ ...criteria, [field]: arr });
    console.log(criteria);
  };
  const [selectedUsabilityGoals, setSelectedUsabilityGoals] = useState<
    string[]
  >([]);
  const [selectedAgeGroups, setSelectedAgeGroups] = useState<string[]>([]);
  const [selectedDomains, setSelectedDomains] = useState<string[]>([]);
  const [selectedDisorders, setSelectedDisorders] = useState<string[]>([]);
  const [selectedGamifications, setSelectedGamifications] = useState<string[]>(
    []
  );
  const [selectedCharacteristics, setSelectedCharacteristics] = useState<
    string[]
  >([]);

  return (
    <div className="w-full border-1 border-black p-6 my-8">
      <div className="flex justify-center py-2">
        <p className="text-black font-bold text-lg">Select parameters</p>
      </div>
      <div className="grid grid-cols-3 gap-2 pt-2">
        <div className="col-span-1 flex flex-col gap-2">
          <MultiSelectDropdown
            options={gamificationGoals}
            selected={criteria.gamificationGoal}
            onChange={setField("gamificationGoal")}
            placeholder="Select gamification goals"
          />
          <MultiSelectDropdown
            options={usabilityGoals}
            selected={criteria.usabilityGoal}
            onChange={setField("usabilityGoal")}
            placeholder="Select usability goals"
          />
          <MultiSelectDropdown
            options={ageGroups}
            selected={criteria.ageGroup}
            onChange={setField("ageGroup")}
            placeholder="Select age groups"
          />
          <MultiSelectDropdown
            options={domains}
            selected={criteria.applicationDomain}
            onChange={setField("applicationDomain")}
            placeholder="Select application domain"
          />
          <MultiSelectDropdown
            options={disorders}
            selected={criteria.disorder}
            onChange={setField("disorder")}
            placeholder="Select disorder"
          />
        </div>
        <div className="col-span-2 flex flex-col gap-2">
          <div className="pb-2 text-black text-sm">
            Select usability characteristics
          </div>
          <div className="grid grid-cols-2 gap-2">
            <Checklist
              options={heuristics}
              selected={criteria.usabilityPrinciple}
              onChange={setField("usabilityPrinciple")}
              placeholder="Nielsen heuristics"
            />
            <Checklist
              options={ISOprinciples}
              selected={criteria.usabilityPrinciple}
              onChange={setField("usabilityPrinciple")}
              placeholder="ISO 9241-110 principles"
            />
          </div>
        </div>
      </div>
    </div>
  );
}
