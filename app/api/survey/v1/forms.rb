module Survey
  module V1
    class Forms < Grape::API
      version 'v1', using: :path
      format :json
      prefix :api # This allows access to API with '/api'
      resource :forms do
        desc 'Show all forms'
        get do
          forms = Form.all
          present forms, with: Survey::Entities::Form
        end

        # Question creation
        desc 'Return a specific form'
        route_param :id do
          get do
            form = Form.find(params[:id])
            present form
          end
          resource :questions do
            desc 'Create a question.'
            params do
              requires :question, type: Hash do
                requires :title, type: String, desc: 'Question title'
                requires :desc, type: Text, desc: 'Question description'
                requires :questiontype, type: String, desc: 'Question type'
              end
            end
            post do
              @form = Form.find(params[:id])
              @question = Question.new(params[:question])
              @question = @form.questions.create!(params[:question])
              # @question.update(questiontype: @questiontype.questiontype)
            end

            # Choice creation
            resource :choices do
              desc 'Create a choice.'
              params do
                requires :choice, type: Hash do
                  requires :answer, type: Text, desc: 'Choice text'
                  requires :checked, type: Boolean, desc: 'Choice status'
                end
              end
              post do
                @question = question.find(params[:id])
                @choice = Choice.new(params[:choice])
                @choice = @question.choices.create!(params[:choice])
              end
            end
          end
        end # end of return a specific form
      end
    end
  end
end
