class Question < ActiveRecord::Base
  belongs_to :exam
  validates_presence_of  :level, :text, :answerR, :answer1, :answer2, :answer3, :answer4

  CATEGORIES_BEG = [
      [ 'Bezpieczeństwo'],
      [ 'ABC, Wywiad środowiskowy'],
      [ 'Krwotoki'],
      [ 'Omdlenia i utraty przytomności'],
      [ 'Oparzenia, odmrożenia'],
      [ 'Hipotermia, hipertermia'],
      [ 'Urazy mechaniczne'],
      [ 'Epilepsja'],      
      [ 'Zadławienia'],
      [ 'RKO']
    ]

    CATEGORIES_ADV = [
      [ 'Zawały'],
      [ 'Zatrucia'],
      [ 'Ciało obce w ciele'],
      [ 'AED'],
      [ 'Porażenia prądem'],
      [ 'Ciśnienie i tętno'],
      [ 'Udary'],
      [ 'Cukrzyca'],
      [ 'Odma płucna'],
      [ 'Wstrząsy']
    ]

    LEVELS = [
      [ 'Beginner'],
      [ 'Advanced']
    ]
end
