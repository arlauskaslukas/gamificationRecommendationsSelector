import { ElementRec } from "@/app/types/types";

interface ElementRecInput {
  gamificationElement: string[]; // selected gamification elements
  disorder: string[]; // selected disorders
  applicationDomain: string[]; // optional, if needed
  usabilityGoal: string[]; // optional, if needed
  gamificationGoal: string[]; // optional, if needed
  ageGroup: string[]; // optional, if needed
}

const fetchElementRecs = async (
  params: ElementRecInput,
  setElementRec: (value: ElementRec) => void
) => {
  try {
    const res = await fetch("/api/elements-usability", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        gamificationElement: params.gamificationElement,
        gamificationGoal: params.gamificationGoal,
        usabilityGoal: params.usabilityGoal,
        disorder: params.disorder,
        applicationDomain: params.applicationDomain,
        ageGroup: params.ageGroup,
      }),
    });

    const data: { data: ElementRec } = await res.json();
    setElementRec(data.data);
  } catch (error) {
    console.error("Failed to fetch elementRec:", error);
  }
};

export default fetchElementRecs;
