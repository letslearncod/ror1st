module Survey
 class Base < Grape::API
  mount Survey::V1::Forms
 end
end
