require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I click edit when viewing an article' do
    describe 'it brings me to a form to edit an article' do
      it 'shows me a form that can edit a previous article' do
        article_1 = Article.create!(title: "Title 1", body: "Body 1")
        article_2 = Article.create!(title: "Title 2", body: "Body 2")

        visit article_path(article_1)

        click_link "Edit"

        expect(current_path).to eq(edit_article_path(article_1))

        fill_in 'article[title]', with: "New Title"
        fill_in 'article[body]', with: "New Body"
        click_on "Edit Article"

        expect(current_path).to eq(article_path(Article.last))
        expect(page).to have_content('New Title')
        expect(page).to have_content('New Body')
      end
    end
  end
end
