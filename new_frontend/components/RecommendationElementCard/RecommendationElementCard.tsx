type RecommendationItemCardProps = {
  title: string;
  index: number;
  example: string;
  recommendationName: string;
};

export default function RecommendationElementCard({
  title,
  index,
  example,
  recommendationName,
}: RecommendationItemCardProps) {
  return (
    <div key={index} className="w-full bg-white text-black py-2 pb-6 px-4">
      <div className="font-bold text-xl">
        <h3>
          #{index + 1} {title}
        </h3>
      </div>
      <div className="flex flex-row text-[16px]">
        <p className="font-bold">Example:&nbsp;</p>
        <p>{example}</p>
      </div>
      <div className="flex flex-row text-[16px] font-bold">
        <p>{recommendationName}</p>
      </div>
    </div>
  );
}
