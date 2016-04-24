require 'rails_helper'

RSpec.describe WizardForm::StepManager, type: :wizard_form do

  let(:total_steps) { 10 }
  let(:completed_step) { 4 }
  let(:current_step) { 5 }
  let(:params) do
    {
      total_steps: total_steps,
      completed_step: completed_step,
      current_step: current_step
    }
  end

  subject { described_class.new(params) }

  describe "#initialize" do
    context 'valid parameters' do
      it { expect(subject.total_steps).to eq(total_steps) }
      it { expect(subject.completed_step).to eq(completed_step) }
      it { expect(subject.current_step).to eq(current_step) }
    end

    context 'invalid total steps' do
      describe 'not integer' do
        let(:total_steps) { 1.5 }

        it 'raises WizardForm::Errors::NotIntegerError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::NotIntegerError)
          end
        end
      end

      describe 'below 1' do
        let(:total_steps) { -1 }

        it 'raises WizardForm::Errors::ZeroOrBelowError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::ZeroOrBelowError)
          end
        end
      end
    end

    context 'invalid completed steps' do
      describe 'not integer' do
        let(:completed_step) { 1.5 }

        it 'raises WizardForm::Errors::NotIntegerError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::NotIntegerError)
          end
        end
      end

      describe 'below 1' do
        let(:completed_step) { -1 }

        it 'raises WizardForm::Errors::ZeroOrBelowError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::ZeroOrBelowError)
          end
        end
      end
    end

    context 'invalid current_step steps' do
      describe 'not integer' do
        let(:current_step) { 1.5 }

        it 'raises WizardForm::Errors::NotIntegerError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::NotIntegerError)
          end
        end
      end

      describe 'below 1' do
        let(:current_step) { -1 }

        it 'raises WizardForm::Errors::ZeroOrBelowError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::ZeroOrBelowError)
          end
        end
      end

      describe 'step is more than the next step after the completed step' do
        let(:current_step) { completed_step + 2 }

        it 'raises WizardForm::Errors::NotPermittedError' do
          expect { subject }.to raise_error do |error|
            expect(error).to be_a(WizardForm::Errors::NotPermittedError)
          end
        end

      end
    end
  end

  describe '#current_step=' do
    context 'valid step' do
      let(:new_current_step) { 3 }
      before { subject.current_step = new_current_step }

      it { expect(subject.current_step = new_current_step).to eq(new_current_step) }
    end

    context 'invalid step' do
      let(:new_current_step) { completed_step + 2 }

      it 'raises WizardForm::Errors::NotPermittedError' do
        expect { subject.current_step = new_current_step }.to raise_error do |error|
          expect(error).to be_a(WizardForm::Errors::NotPermittedError)
        end
      end
    end
  end

  describe '#wizard_completed?' do
    context 'not complete' do
      it { expect(subject.wizard_completed?).to be_falsey }
    end

    context 'completed' do
      let(:completed_step) { total_steps }
      it { expect(subject.wizard_completed?).to be_truthy }
    end
  end

  describe '#step_completed?' do
    it { expect(subject.step_completed?(subject.next_step) ).to be_falsey }
    it { expect(subject.step_completed?(completed_step) ).to be_truthy }
  end

  describe '#next_step' do
    it { expect(subject.next_step ).to eq(completed_step+1) }
  end

  describe '#last_permitted_step' do
    context 'wizard is completed' do
      let(:completed_step) { total_steps }
      it { expect(subject.last_permitted_step ).to eq(completed_step) }
    end

    context 'wizard is incomplete' do
      it { expect(subject.last_permitted_step ).to eq(subject.next_step) }
    end
  end

end
