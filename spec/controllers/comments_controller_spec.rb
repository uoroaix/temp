require 'spec_helper'

describe CommentsController do

  let(:question) { create(:question) }
  let(:answer) { create(:answer, question: question) }
  let(:user) { create(:user) }


  describe "#create" do
    def valid_request
      post :create, answer_id: answer.id, comment: {body: "valid body"}
    end

    def invalid_request
      post :create, answer_id: answer.id, comment: {body: ""}
    end

    context "without signed in user" do
      it "dosn't create a record in the database" do
        expect { valid_request }.to_not change { Comment.count }
      end

      it "redirects users to sign in page" do
        valid_request
        expect(response).to redirect_to(new_user_session_path)
      end

    end

    context "with signed in user" do
      before { sign_in user }
    

      context "with valid request" do 

        it "creates a comment in the database" do
          expect { valid_request }.to change { Comment.count }.by(1)
        end


        it "associates the comment with the answer whose id is passed" do
          expect { valid_request }.to change { answer.comments.count }.by(1)
        end

        it "redirect to the question page" do
          valid_request
          expect(response).to redirect_to(question)
        end

      end

      context "with invalid request" do

        it "doesn't create a comment" do
          expect { invalid_request }.to_not change { Comment.count }
        end

        it "renders the question show page" do
          invalid_request
          expect(response).to render_template("questions/show")
        end


        it "sets falsh alert" do
          invalid_request
          expect(flash[:alert]).to be
        end
      end

    end

  end


  describe "#destroy" do
    let!(:comment) { create(:comment, answer: answer) }
    def delete_request
      delete :destroy, answer_id: answer.id, id: comment.id
    end

    context "without a signed in user" do

      it "redirect user to sign in page" do
        delete_request
        #expect(response).to redirect_to(new_user_session_path)
        response.should redirect_to(new_user_session_path)
      end

    end

    context "with a signed in user" do
      before { sign_in user }

      it "should decrease the number of comments by one" do
        expect { delete_request }.to change{Comment.count}.by(-1)
      end

      it "should redirect to question page with successfuly delete" do
        delete_request
        response.should redirect_to(question)
      end

      it "sets a notice flash message" do
        delete_request
        expect(flash[:notice]).to be
      end

    end
  end

end
