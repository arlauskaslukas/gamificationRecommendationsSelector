"use client";
import InputForm from "@/components/InputForm/InputForm";
import OutputSpace from "@/components/OutputSpace/OutputSpace";
import { Criteria } from "./types/types";
import { useState } from "react";

export default function Home() {
  const [criteria, setCriteria] = useState<Criteria>({
    usabilityGoal: [],
    ageGroup: [],
    disorder: [],
    applicationDomain: [],
    usabilityPrinciple: [],
    gamificationGoal: [],
  });
  return (
    <div className="">
      <main className="container flex mx-auto flex-col items-center justify-between p-4">
        <InputForm criteria={criteria} onChange={setCriteria} />
        <OutputSpace criteria={criteria} />
      </main>
      <footer className=""></footer>
    </div>
  );
}
