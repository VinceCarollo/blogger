require 'rails_helper'

describe 'user clicks create new article' do 
    describe 'user goes to form' do 
        it 'allows user to create artiticle' do 
            visit articles_path 
            
            click_link "Create a New Article"

            expect(current_path).to eq(new_article_path)

            fill_in 'article[title]', with: 'New Title!'
            fill_in 'article[body]', with: 'New Body!'
            click_on 'Create Article'

            expect(page).to have_content('New Title!')
            expect(page).to have_content('New Body!')
        end
    end
end