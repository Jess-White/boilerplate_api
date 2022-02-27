require "rails_helper"

describe Api::GrantsController do
  grant_fields = %w(
    id created_at updated_at deadline title rfp_url submitted successful purpose archived
    funding_org funding_org_id funding_org_name funding_org_url organization_id organization_name reports sections
  )

  before(:example) {
    org = Organization.create!({
      name: "The Bad Place",
      users: [
        User.new({ email: "shawn@bad.place", password: "shawn", first_name: "Shawn" }),
      ],
      funding_orgs: [
        FundingOrg.new({ website: "https://thebadplace.com", name: "The Bad Place" }),
      ],
    })

    org.grants.create!([
      {
        title: "Bad Place Neighborhood Grant",
        funding_org: org.funding_orgs.first,
        rfp_url: "https://goodorbad.com/newneighborhoods",
        deadline: DateTime.now.next_week.utc,
        submitted: true,
        successful: true,
        purpose: "general funding",
      },
    ])

    org
  }

  let(:chidi) {
    User.create!({ email: "chidi@good.place", password: "chidi", first_name: "Chidi", last_name: "Anagonye" })
  }

  let(:good_place) {
    good_place = Organization.create!({
      name: "The Good Place",
      users: [
        chidi,
        User.new({ email: "tahani@good.place", password: "tahani", first_name: "Tahani", last_name: "Al-Jamil" }),
      ],
      funding_orgs: [
        FundingOrg.new({ website: "https://thegoodplace.com", name: "The Good Place" }),
      ],
    })

    good_place.grants.create!([
      {
        title: "Good Place Neighborhood Grant",
        funding_org: good_place.funding_orgs.first,
        rfp_url: "https://goodorbad.com/newneighborhoods",
        deadline: DateTime.now.next_week.utc,
        submitted: true,
        successful: false,
        purpose: "general funding",
      },
      {
        title: "Bad Janet Restorative Justice Initiative Grant",
        funding_org: good_place.funding_orgs.first,
        rfp_url: "https://goodorbad.com/newneighborhoods",
        deadline: DateTime.now.next_week.utc,
        submitted: false,
        successful: false,
        purpose: "janet funding",
      },
    ])

    good_place
  }

  describe "GET /organizations/:organization_id/grants" do
    it "renders 401 if unauthenticated" do
      get :index, params: { organization_id: good_place.id }

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      get :index, params: { organization_id: good_place.id }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with organization grants" do
      set_auth_header(chidi)
      get :index, params: { organization_id: good_place.id }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to match([
        a_hash_including(
          "id" => good_place.grants.second.id,
          "created_at" => good_place.grants.second.created_at.iso8601(3),
          "updated_at" => good_place.grants.second.updated_at.iso8601(3),
          "deadline" => good_place.grants.second.deadline.iso8601(3),
          "title" => "Bad Janet Restorative Justice Initiative Grant",
          "rfp_url" => "https://goodorbad.com/newneighborhoods",
          "submitted" => false,
          "successful" => false,
          "purpose" => "janet funding",
        ),
        a_hash_including(
          "id" => good_place.grants.first.id,
          "created_at" => good_place.grants.first.created_at.iso8601(3),
          "updated_at" => good_place.grants.first.updated_at.iso8601(3),
          "deadline" => good_place.grants.first.deadline.iso8601(3),
          "title" => "Good Place Neighborhood Grant",
          "rfp_url" => "https://goodorbad.com/newneighborhoods",
          "submitted" => true,
          "successful" => false,
          "purpose" => "general funding",
        ),
      ])
    end
  end

  describe "POST /organizations/:organization_id/grants" do
    let(:new_grant_fields) {
      {
        organization_id: good_place.id,
        funding_org_id: good_place.funding_orgs[0].id,
        title: "Jason Mendoza Guacamole Grant",
        rfp_url: "https://goodorbad.com/newneighborhoods",
        deadline: DateTime.now.next_week.utc,
        submitted: false,
        successful: false,
        purpose: "general funding",
      }
    }

    it "renders 401 if unauthenticated" do
      post :create, params: new_grant_fields

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      post :create, params: new_grant_fields

      expect(response).to have_http_status(401)
    end

    it "renders 422 if given invalid or missing params" do
      set_auth_header(chidi)
      post :create, params: {
        organization_id: good_place.id,
      }

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body).keys).to contain_exactly("errors")
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "errors" => [match(/Title is too short/), match(/Funding org must exist/)],
        ),
      )
    end

    it "renders 201 with created grant" do
      set_auth_header(chidi)
      post :create, params: new_grant_fields

      expect(response).to have_http_status(201)
      expect(JSON.parse(response.body).keys).to contain_exactly(*grant_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "id" => kind_of(Integer),
          "created_at" => kind_of(String),
          "updated_at" => kind_of(String),
          "deadline" => kind_of(String),
          "title" => new_grant_fields[:title],
          "rfp_url" => new_grant_fields[:rfp_url],
          "submitted" => new_grant_fields[:submitted],
          "successful" => new_grant_fields[:successful],
          "purpose" => new_grant_fields[:purpose],
        ),
      )
    end
  end

  describe "GET /organizations/:organization_id/grants/:grant_id" do
    it "renders 401 if unauthenticated" do
      get :show, params: {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
      }

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      get :show, params: {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
      }

      expect(response).to have_http_status(401)
    end

    it "renders 401 if grant does not exist" do
      set_auth_header(chidi)
      get :show, params: {
        organization_id: good_place.id,
        id: "123",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with grant" do
      set_auth_header(chidi)
      get :show, params: {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
      }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).keys).to contain_exactly(*grant_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(

          "id" => kind_of(Integer),
          "created_at" => kind_of(String),
          "updated_at" => kind_of(String),
          "deadline" => kind_of(String),
          "title" => "Good Place Neighborhood Grant",
          "rfp_url" => "https://goodorbad.com/newneighborhoods",
          "submitted" => true,
          "successful" => false,
          "purpose" => "general funding",
        ),
      )
    end
  end

  describe "PATCH /organizations/:organization_id/grants/:grant_id" do
    let(:updated_grant_fields) {
      {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
        title: "(Not So) Good Place Neighborhood Grant",
        submitted: true,
        purpose: "very general funding",
      }
    }

    it "renders 401 if unauthenticated" do
      patch :update, params: updated_grant_fields

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      patch :update, params: updated_grant_fields

      expect(response).to have_http_status(401)
    end

    it "renders 401 if grant does not exist" do
      set_auth_header(chidi)
      patch :update, params: {
        **updated_grant_fields,
        id: "123",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 422 if given invalid or missing params" do
      set_auth_header(chidi)
      patch :update, params: {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
        title: "",
      }

      expect(response).to have_http_status(422)
      expect(JSON.parse(response.body).keys).to contain_exactly("errors")
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "errors" => [match(/Title is too short/)],
        ),
      )
    end

    it "renders 200 with updated grant" do
      grant = good_place.grants.first

      set_auth_header(chidi)
      patch :update, params: updated_grant_fields

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).keys).to contain_exactly(*grant_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "id" => grant.id,
          "created_at" => grant.created_at.iso8601(3),
          "updated_at" => kind_of(String),
          "deadline" => grant.deadline.iso8601(3),
          "rfp_url" => grant.rfp_url,
          "successful" => grant.successful,
          "title" => updated_grant_fields[:title],
          "submitted" => updated_grant_fields[:submitted],
          "purpose" => updated_grant_fields[:purpose],
        ),
      )
    end
  end

  describe "DELETE /organizations/:organization_id/grants/:grant_id" do
    it "renders 401 if unauthenticated" do
      delete :destroy, params: {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
      }

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      delete :destroy, params: {
        organization_id: good_place.id,
        id: good_place.grants.first.id,
      }

      expect(response).to have_http_status(401)
    end

    it "renders 401 if grant does not exist" do
      set_auth_header(chidi)
      delete :destroy, params: {
        organization_id: good_place.id,
        id: "123",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with deleted organization" do
      grant = good_place.grants.first

      set_auth_header(chidi)
      delete :destroy, params: {
        organization_id: good_place.id,
        id: grant.id,
      }

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "id" => grant.id,
          "created_at" => grant.created_at.iso8601(3),
          "updated_at" => grant.updated_at.iso8601(3),
          "deadline" => grant.deadline.iso8601(3),
          "title" => grant.title,
          "rfp_url" => grant.rfp_url,
          "submitted" => grant.submitted,
          "successful" => grant.successful,
          "purpose" => grant.purpose,
        ),
      )
    end
  end

  describe "POST /organizations/:organization_id/grants/:grant_id/copy" do
    let(:copied_grant_fields) {
      {
        organization_id: good_place.id,
        grant_id: good_place.grants.first.id,
        title: "Good Place Neighborhood Grant (copy)",
        rfp_url: "https://newgrant",
        deadline: DateTime.now.next_week.utc.iso8601(3),
        purpose: "General funding",
      }
    }

    it "renders 401 if unauthenticated" do
      post :copy, params: copied_grant_fields

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      post :copy, params: copied_grant_fields

      expect(response).to have_http_status(401)
    end

    it "renders 401 if grant does not exist" do
      set_auth_header(chidi)
      post :copy, params: {
        **copied_grant_fields,
        grant_id: "123",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with copied grant" do
      set_auth_header(chidi)
      post :copy, params: copied_grant_fields

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).keys).to contain_exactly(*grant_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "id" => kind_of(Integer),
          "created_at" => kind_of(String),
          "updated_at" => kind_of(String),
          "submitted" => false,
          "successful" => false,
          "archived" => false,
          "deadline" => copied_grant_fields[:deadline],
          "title" => copied_grant_fields[:title],
          "rfp_url" => copied_grant_fields[:rfp_url],
          "purpose" => copied_grant_fields[:purpose],
        ),
      )
    end
  end

  describe "PATCH /organizations/:organization_id/grants/:grant_id/reorder_section/:section_id" do
    section_fields = %w(id created_at updated_at grant_id title text wordcount sort_order)

    let(:sections) {
      good_place.grants.first.sections.create!([
        {
          title: "Overview of the Organization",
          text: "Lorem ipsum overview",
          sort_order: 0,
          wordcount: 2,
        },
        {
          title: "Program Goals",
          text: "Lorem ipsum goals",
          sort_order: 1,
          wordcount: 2,
        },
        {
          title: "Programs",
          text: "Lorem ipsum programs",
          sort_order: 2,
          wordcount: 2,
        },
      ])
    }
    let(:reorder_params) {
      {
        organization_id: good_place.id,
        grant_id: good_place.grants.first.id,
        section_id: sections.second.id,
        sort_order: 0,
      }
    }

    it "renders 401 if unauthenticated" do
      patch :reorder_section, params: reorder_params

      expect(response).to have_http_status(401)
    end

    it "renders 401 if not member of organization" do
      shawn = User.find_by!(first_name: "Shawn")

      set_auth_header(shawn)
      patch :reorder_section, params: reorder_params

      expect(response).to have_http_status(401)
    end

    it "renders 401 if grant does not exist" do
      set_auth_header(chidi)
      patch :reorder_section, params: {
        **reorder_params,
        grant_id: "123",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 401 if section does not exist" do
      set_auth_header(chidi)
      patch :reorder_section, params: {
        **reorder_params,
        section_id: "123",
      }

      expect(response).to have_http_status(401)
    end

    it "renders 200 with reorded section" do
      set_auth_header(chidi)
      patch :reorder_section, params: reorder_params

      expect(response).to have_http_status(200)
      expect(JSON.parse(response.body).keys).to contain_exactly(*section_fields)
      expect(JSON.parse(response.body)).to match(
        a_hash_including(
          "id" => kind_of(Integer),
          "created_at" => kind_of(String),
          "updated_at" => kind_of(String),
          "grant_id" => sections.second.grant_id,
          "title" => sections.second.title,
          "text" => sections.second.text,
          "wordcount" => sections.second.wordcount,
          "sort_order" => reorder_params[:sort_order],
        ),
      )
    end
  end
end