# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Librum::Tabletop::View::Components::Publishers::Form,
  type: :component \
do
  subject(:form) { described_class.new(**constructor_options) }

  let(:data) do
    {
      'publisher' => FactoryBot.build(:publisher, name: 'Custom Publisher')
    }
  end
  let(:action) { 'new' }
  let(:resource) do
    Cuprum::Rails::Resource.new(
      resource_class: Librum::Tabletop::Publisher,
      resource_name:  'publishers'
    )
  end
  let(:constructor_options) do
    {
      action:   action,
      data:     data,
      resource: resource
    }
  end

  describe '.new' do
    it 'should define the constructor' do
      expect(described_class)
        .to be_constructible
        .with(0).arguments
        .and_keywords(:action, :data, :resource)
        .and_any_keywords
    end
  end

  describe '#action' do
    include_examples 'should define reader', :action, -> { action }
  end

  describe '#call' do
    let(:rendered) { render_inline(form) }

    describe 'with action: edit' do
      let(:action) { 'edit' }
      let(:data) do
        {
          'publisher' => FactoryBot.build(:publisher, name: 'Custom Publisher')
        }
      end
      let(:snapshot) do
        <<~HTML
          <form action="/publishers/custom-publisher" accept-charset="UTF-8" method="post">
            <input type="hidden" name="_method" value="patch" autocomplete="off">

            <input type="hidden" name="authenticity_token" value="[token]" autocomplete="off">

            <div class="field">
              <label for="publisher_name" class="label">Name</label>

              <div class="control">
                <input id="publisher_name" name="publisher[name]" class="input" type="text" value="Custom Publisher">
              </div>
            </div>

            <div class="field">
              <label for="publisher_slug" class="label">Slug</label>

              <div class="control">
                <input id="publisher_slug" name="publisher[slug]" class="input" type="text" value="custom-publisher">
              </div>
            </div>

            <div class="field">
              <label for="publisher_website" class="label">Website</label>

              <div class="control">
                <input id="publisher_website" name="publisher[website]" class="input" type="text" value="">
              </div>
            </div>

            <div class="field mt-5">
              <div class="control">
                <div class="columns">
                  <div class="column is-half-tablet is-one-quarter-desktop">
                    <button type="submit" class="button is-primary is-fullwidth">Update Publisher</button>
                  </div>

                  <div class="column is-half-tablet is-one-quarter-desktop">
                    <a class="button is-fullwidth has-text-black" href="/publishers/custom-publisher" target="_self">
                      Cancel
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </form>
        HTML
      end

      it { expect(rendered).to match_snapshot(snapshot) }
    end

    describe 'with action: new' do
      let(:action) { 'new' }
      let(:data)   { nil }
      let(:snapshot) do
        <<~HTML
          <form action="/publishers" accept-charset="UTF-8" method="post">
            <input type="hidden" name="authenticity_token" value="[token]" autocomplete="off">

            <div class="field">
              <label for="publisher_name" class="label">Name</label>

              <div class="control">
                <input id="publisher_name" name="publisher[name]" class="input" type="text" value="">
              </div>
            </div>

            <div class="field">
              <label for="publisher_slug" class="label">Slug</label>

              <div class="control">
                <input id="publisher_slug" name="publisher[slug]" class="input" type="text" value="">
              </div>
            </div>

            <div class="field">
              <label for="publisher_website" class="label">Website</label>

              <div class="control">
                <input id="publisher_website" name="publisher[website]" class="input" type="text" value="">
              </div>
            </div>

            <div class="field mt-5">
              <div class="control">
                <div class="columns">
                  <div class="column is-half-tablet is-one-quarter-desktop">
                    <button type="submit" class="button is-primary is-fullwidth">Create Publisher</button>
                  </div>

                  <div class="column is-half-tablet is-one-quarter-desktop">
                    <a class="button is-fullwidth has-text-black" href="/publishers" target="_self">
                      Cancel
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </form>
        HTML
      end

      it { expect(rendered).to match_snapshot(snapshot) }
    end
  end

  describe '#data' do
    include_examples 'should define reader', :data, -> { data }
  end

  describe '#resource' do
    include_examples 'should define reader', :resource, -> { resource }
  end

  describe '#singular_resource_name' do
    include_examples 'should define reader',
      :singular_resource_name,
      -> { resource.singular_resource_name }
  end
end
