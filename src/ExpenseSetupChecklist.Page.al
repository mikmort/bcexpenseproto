page 50200 "Expense Setup Checklist"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Expense Management Setup Checklist';
    Editable = false;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Setup Overview';
                
                field(OverallStatus; OverallStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Overall Status';
                    Style = Strong;
                    StyleExpr = true;
                }
            }

            group(RequiredSetup)
            {
                Caption = 'Required Setup';

                field(NumberSeriesStatus; NumberSeriesStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Number Series Configuration';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = NumberSeriesComplete;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Management Setup");
                    end;
                }

                field(MasterDataStatus; MasterDataStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Master Data Setup';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = MasterDataComplete;

                    trigger OnDrillDown()
                    var
                        SetupData: Codeunit "Expense Setup Data";
                        IntegerRec: Record Integer;
                    begin
                        if not MasterDataComplete then begin
                            if Confirm('Would you like to create the default master data now?') then begin
                                SetupData.Run(IntegerRec);
                                UpdateStatus();
                            end;
                        end;
                    end;
                }

                field(CategoriesStatus; CategoriesStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Expense Categories';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = CategoriesComplete;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Categories List");
                    end;
                }

                field(PaymentMethodsStatus; PaymentMethodsStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Payment Methods';
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = PaymentMethodsComplete;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Payment Methods List");
                    end;
                }
            }

            group(OptionalSetup)
            {
                Caption = 'Optional Setup';

                field(PoliciesStatus; PoliciesStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Expense Policies';
                    Editable = false;
                    Style = Subordinate;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Policies List");
                    end;
                }

                field(LocationsStatus; LocationsStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Expense Locations';
                    Editable = false;
                    Style = Subordinate;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Locations List");
                    end;
                }

                field(EmployeesStatus; EmployeesStatusText)
                {
                    ApplicationArea = All;
                    Caption = 'Employee Setup';
                    Editable = false;
                    Style = Subordinate;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Employees List");
                    end;
                }
            }

            group(QuickActions)
            {
                Caption = 'Quick Actions';

                field(RunSetupWizard; 'Run Setup Wizard')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Editable = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Management Setup Wizard");
                        UpdateStatus();
                    end;
                }

                field(CreateDemoData; 'Create Demo Data')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Editable = false;
                    Style = Subordinate;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    var
                        DemoData: Codeunit "Expense Demo Data";
                        IntegerRec: Record Integer;
                    begin
                        if Confirm('This will create sample data for demonstration purposes. Continue?') then begin
                            DemoData.Run(IntegerRec);
                            UpdateStatus();
                        end;
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Refresh)
            {
                ApplicationArea = All;
                Caption = 'Refresh';
                Image = Refresh;
                ToolTip = 'Refresh the setup status information.';

                trigger OnAction()
                begin
                    UpdateStatus();
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        UpdateStatus();
    end;

    var
        OverallStatusText: Text;
        NumberSeriesStatusText: Text;
        MasterDataStatusText: Text;
        CategoriesStatusText: Text;
        PaymentMethodsStatusText: Text;
        PoliciesStatusText: Text;
        LocationsStatusText: Text;
        EmployeesStatusText: Text;
        NumberSeriesComplete: Boolean;
        MasterDataComplete: Boolean;
        CategoriesComplete: Boolean;
        PaymentMethodsComplete: Boolean;

    local procedure UpdateStatus()
    var
        ExpenseSetup: Record "Expense Management Setup";
        ExpenseCategory: Record "Expense Categories";
        PaymentMethod: Record "Payment Methods";
        ExpensePolicy: Record "Expense Policies";
        ExpenseLocation: Record "Expense Locations";
        Employee: Record Employees;
        PostingGroup: Record "Expense Posting Groups";
        ExpenseGroup: Record "Expense Groups";
        CompletedCount: Integer;
        RequiredCount: Integer;
    begin
        RequiredCount := 4; // Number series, master data, categories, payment methods

        // Check Number Series
        NumberSeriesComplete := false;
        if ExpenseSetup.Get(1) then begin
            if (ExpenseSetup."Expense Report No. Sequence" <> '') and 
               (ExpenseSetup."Posted Expense Report No Seq." <> '') then begin
                NumberSeriesStatusText := 'Configured ✓';
                NumberSeriesComplete := true;
                CompletedCount += 1;
            end else
                NumberSeriesStatusText := 'Not configured';
        end else
            NumberSeriesStatusText := 'Not configured';

        // Check Master Data (Posting Groups and Expense Groups)
        MasterDataComplete := false;
        if (not PostingGroup.IsEmpty()) and (not ExpenseGroup.IsEmpty()) then begin
            MasterDataStatusText := 'Configured ✓';
            MasterDataComplete := true;
            CompletedCount += 1;
        end else
            MasterDataStatusText := 'Not configured';

        // Check Categories
        CategoriesComplete := false;
        if not ExpenseCategory.IsEmpty() then begin
            ExpenseCategory.SetRange(Active, true);
            CategoriesStatusText := StrSubstNo('%1 categories configured ✓', ExpenseCategory.Count());
            CategoriesComplete := true;
            CompletedCount += 1;
        end else
            CategoriesStatusText := 'No categories configured';

        // Check Payment Methods
        PaymentMethodsComplete := false;
        if not PaymentMethod.IsEmpty() then begin
            PaymentMethodsStatusText := StrSubstNo('%1 payment methods configured ✓', PaymentMethod.Count());
            PaymentMethodsComplete := true;
            CompletedCount += 1;
        end else
            PaymentMethodsStatusText := 'No payment methods configured';

        // Optional setups
        if not ExpensePolicy.IsEmpty() then
            PoliciesStatusText := StrSubstNo('%1 policies configured', ExpensePolicy.Count())
        else
            PoliciesStatusText := 'No policies configured (optional)';

        if not ExpenseLocation.IsEmpty() then
            LocationsStatusText := StrSubstNo('%1 locations configured', ExpenseLocation.Count())
        else
            LocationsStatusText := 'No locations configured (optional)';

        if not Employee.IsEmpty() then
            EmployeesStatusText := StrSubstNo('%1 employees configured', Employee.Count())
        else
            EmployeesStatusText := 'No employees configured (optional)';

        // Overall Status
        if CompletedCount = RequiredCount then
            OverallStatusText := 'Setup Complete ✓'
        else
            OverallStatusText := StrSubstNo('Setup Incomplete - %1 of %2 required items completed', CompletedCount, RequiredCount);
    end;
}
