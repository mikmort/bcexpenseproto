codeunit 50191 "Expense Mgmt Guided Setup"
{
    // This codeunit integrates with Business Central's Assisted Setup framework
    // to provide a guided setup experience for the Expense Management system

    trigger OnRun()
    begin
        Page.RunModal(Page::"Expense Mgmt Setup Wizard");
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Guided Experience", 'OnRegisterAssistedSetup', '', false, false)]
    local procedure OnRegisterAssistedSetup()
    var
        GuidedExperience: Codeunit "Guided Experience";
        AssistedSetupGroup: Enum "Assisted Setup Group";
        VideoCategory: Enum "Video Category";
    begin
        GuidedExperience.InsertAssistedSetup(
            'Expense Management Setup',
            'Set up Expense Management',
            'Configure the Expense Management system with number series, categories, and other essential settings.',
            5,
            ObjectType::Page,
            Page::"Expense Mgmt Setup Wizard",
            AssistedSetupGroup::Extensions,
            '',
            VideoCategory::Extensions,
            '');
    end;

    procedure IsSetupComplete(): Boolean
    var
        ExpenseSetup: Record "Expense Management Setup";
        ExpenseCategory: Record "Expense Categories";
        PaymentMethod: Record "Payment Methods";
    begin
        // Check if basic setup is complete
        if not ExpenseSetup.Get(1) then
            exit(false);

        if (ExpenseSetup."Expense Report No. Sequence" = '') or
           (ExpenseSetup."Posted Expense Report No Seq." = '') then
            exit(false);

        // Check if at least one expense category exists
        if ExpenseCategory.IsEmpty() then
            exit(false);

        // Check if at least one payment method exists
        if PaymentMethod.IsEmpty() then
            exit(false);

        exit(true);
    end;

    procedure GetSetupStatus(): Text
    var
        ExpenseSetup: Record "Expense Management Setup";
        ExpenseCategory: Record "Expense Categories";
        PaymentMethod: Record "Payment Methods";
        SetupItems: Integer;
        CompletedItems: Integer;
    begin
        SetupItems := 3; // Number series, categories, payment methods

        if ExpenseSetup.Get(1) then begin
            if (ExpenseSetup."Expense Report No. Sequence" <> '') and
               (ExpenseSetup."Posted Expense Report No Seq." <> '') then
                CompletedItems += 1;
        end;

        if not ExpenseCategory.IsEmpty() then
            CompletedItems += 1;

        if not PaymentMethod.IsEmpty() then
            CompletedItems += 1;

        exit(StrSubstNo('%1 of %2 setup steps completed', CompletedItems, SetupItems));
    end;
}
