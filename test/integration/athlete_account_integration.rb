#encoding: utf-8
require "test_helper"

describe "Athlete account integration" do
  it "signup" do
    visit '/'
    click_link 'Créer un compte'
    fill_in 'Email', with: 'franck@example.com'
    fill_in 'Mot de passe', with: 'mypassword'
    fill_in 'Confirmation du mot de passe', with: 'mypassword'
    click_button 'Créer le compte'
    page.must_have_content "Bienvenue"
  end
  describe "when Athlete exit" do
    before do
      @athlete = FactoryGirl.create(:athlete)
    end
    it "signin" do
      visit '/'
      fill_in 'Email', with: @athlete.email
      fill_in 'Mot de passe', with: @athlete.password
      click_button 'Connexion'
      page.must_have_content 'Connecté avec succès'
    end
    describe "and his signed in" do
      before do
        sign_in(@athlete)
      end
      it "signout" do
        click_link 'Se déconnecter'
        page.must_have_content 'Se connecter'
      end
      it "edit email"
      it "edit password"
      it "delete account"
    end
  end
end
