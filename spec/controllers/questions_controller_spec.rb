require "spec_helper"


describe QuestionsController do 
  let(:user) { create(:user) }
  let(:user1) { create(:user) }

  let(:question) { create(:question, user: user) }
  let(:question1) { create(:question, user: user1) }




  describe '#index' do

    it "assigns a variable @questions" do
      get :index
      expect(assigns(:questions)).to be
    end

    it "includes all questions in the database" do
      question = create(:question)
      get :index
      expect(assigns(:questions)).to include(question)
    end

    it "renders index template" do
      get :index
      expect(response).to render_template(:index)
    end

    it "only fetches 10 questions" do
      20.times { create(:question) }
      get :index
      expect(assigns(:questions).length).to eq(10)
    end
  end

  describe '#new' do

    context "with signed in user" do
      before { sign_in user }
      it "should assigns a new question" do
        get :new
        expect(assigns(:question)).to be_a_new(Question)
      end

      it "renders new template" do
        get :new
        expect(response).to render_template(:new)
      end
    end


    context "with signed out user" do
      it "redirects to sign in page" do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
  
  describe '#create' do
    context "with no signed in user" do
      it "redirect to sign in page" do
        post :create
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "with signed in user" do
      before { sign_in user }
      

      context "with valid request" do 

        def valid_request
          post :create, question: {title: "valid title", description: "valid description"}
        end

        it "creates a question in the database" do
          expect { valid_request }.to change { Question.count }.by(1)
        end

        it "redirect to questions listing page with valid request" do
          valid_request
          expect(response).to redirect_to(questions_path)
        end

        it "sets the flash message with valid request" do
          valid_request
          expect(flash[:notice]).to be
        end

        it "assigns the question to the signed in user" do
          expect { valid_request }.to change { user.questions.count }.by(1)
        end
      end
      
      context "with invalid request" do
        
        def invalid_request
            post :create, question: {title: "", description: "valid description"}
        end

        it "doesn't change the number of questions in the database" do
          expect { invalid_request }.to_not change { Question.count }
        end

        it "renders new template" do
          invalid_request
          expect(response).to render_template(:new)
        end 

      end

    end
  end

  describe '#show' do

    context "with no signed in user" do
      it "assigns the question with the passed id" do
        get :show, id: question.id
        expect(assigns(:question)).to eq(question)
      end

      it "renders the show template" do
        get :show, id: question.id
        expect(response).to render_template(:show)
      end
    end
  end

  describe '#edit' do
    context "with signed out user" do

      it "redirects to new session path" do
        get :edit, id: question.id
        expect(response).to redirect_to(new_user_session_path)
      end

    end

    context "with signed in user" do
      before { sign_in user }


      it "assigns the question with the current passed id" do
        get :edit, id: question.id
        expect(assigns(:question)).to eq(question)
      end

      it "renders the edit template" do
        get :edit, id: question.id
        expect(response).to render_template(:edit)
      end

      it "raises error if trying to edit another user's question" do
        expect { get :edit, id: question1.id }.to raise_error
      end

    end
  end

  describe '#update' do
    context "with signed in user" do
      before { sign_in user }

      it "update the question with new title" do
        patch :update, id: question.id, question: {title: "some new title"}
        question.reload
        expect(question.title).to match /some new title/i
      end

      it "redirects to question show page after successful update" do
        patch :update, id: question.id, question: {title: "some new title"}
        expect(response).to redirect_to(question)
      end

      it "renders edit template with failed update" do
        patch :update, id: question.id, question: {title: ""}
        expect(response).to render_template(:edit)
      end

      it "sets flash message with successful update" do
        patch :update, id: question.id, question: {title: "some new title"}
        expect(flash[:notice]).to be
      end

      it "raises an error if trying to update another user's question" do
        expect do
          patch :update, id: question1.id, question: {title: "asdfsdf"}
        end.to raise_error
      end
    end
  end

  describe '#destroy' do

    context "with signed in user" do
      before {sign_in user}
      before { question }

      it "removes the question from the database" do
        expect do
          delete :destroy, id: question.id
        end.to change { Question.count }.by(-1)
      end

      it "redirects to questions listing page with successful delete" do
        delete :destroy, id: question.id
        expect(response).to redirect_to(questions_path)
      end

      it "raises error when trying to delete another person's question" do
        expect do
          delete :destroy, id: question1.id
        end.to raise_error
      end

    end

  end

end