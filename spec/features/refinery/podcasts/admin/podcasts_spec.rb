# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Podcasts" do
    describe "Admin" do
      describe "podcasts", type: :feature do
        describe "podcasts list" do
          before do
            FactoryGirl.create :podcast, title: "UniqueTitleOne"
            FactoryGirl.create :podcast, title: "UniqueTitleTwo"
          end

          it "shows two items" do
            visit refinery.podcasts_admin_podcasts_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before(:each) do
            visit refinery.podcasts_admin_podcasts_path

            click_link "Add New Podcast"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Podcasts::Podcast.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              expect(page).to have_content("Title can't be blank")
              Refinery::Podcasts::Podcast.count.should == 0
            end
          end

          context "duplicate" do
            before(:each) { FactoryGirl.create(:podcast, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.podcasts_admin_podcasts_path

              click_link "Add New Podcast"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              expect(page).to have_content("There were problems")
              Refinery::Podcasts::Podcast.count.should == 1
            end
          end

        end

        describe "edit" do
          before(:each) { FactoryGirl.create(:podcast, :title => "A title") }

          it "should succeed" do
            visit refinery.podcasts_admin_podcasts_path

            within ".actions" do
              click_link "Edit this podcast"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).to have_no_content("A title")
          end
        end

        describe "destroy" do
          before(:each) { FactoryGirl.create(:podcast, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.podcasts_admin_podcasts_path

            click_link "Remove this podcast forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Podcasts::Podcast.count.should == 0
          end
        end

      end
    end
  end
end
