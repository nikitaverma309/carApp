

class FAQModel {
  final String question;
  final String answer;

  FAQModel({required this.answer, required this.question});
}


List<FAQModel> faqList = [
  FAQModel(
      question: "How old do I need to be to rent a car?",
      answer: "You typically need to be at least 21 years old, although some rental companies may require you to be 25 or older."
  ),
  FAQModel(
      question: "What documents do I need to rent a car?",
      answer: "You'll generally need a valid driver's license, a credit/debit card in your name, and sometimes additional identification."
  ),
  FAQModel(
      question: "Can I rent a car without a credit card?",
      answer: "Some rental companies accept debit cards, but most require a credit card as a form of payment and security deposit."
  ),
  FAQModel(
      question: "Are there any mileage restrictions?",
      answer: "Many rental agreements include unlimited mileage, but it's essential to check the terms beforehand to avoid extra fees."
  ),
  FAQModel(
      question: "Can I add an additional driver to the rental?",
      answer: "Yes, you can usually add one or more additional drivers to the rental agreement, often for an extra fee."
  ),
  FAQModel(
      question: "What happens if the car breaks down?",
      answer: "Rental companies often provide roadside assistance in case of breakdowns. Contact their support for assistance."
  ),
  FAQModel(
      question: "Is insurance included in the rental?",
      answer: "Basic insurance is often included, but there might be options for additional coverage. Check the rental terms."
  ),
  FAQModel(
      question: "Can I cancel or modify my reservation?",
      answer: "Most rental companies allow modifications or cancellations, but there might be fees depending on the timing."
  ),
  FAQModel(
      question: "What if I return the car late?",
      answer: "Late returns might result in extra charges. Try to return the car on time or inform the rental company about any delays."
  ),
  FAQModel(
      question: "Can I rent a specific make or model of car?",
      answer: "You can often request a specific car, but availability depends on the rental company's fleet at the time of booking."
  ),
];