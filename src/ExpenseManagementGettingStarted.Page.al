page 50195 "Expense Mgmt Getting Started"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Getting Started with Expense Management';
    Editable = false;

    layout
    {
        area(content)
        {
            group(Welcome)
            {
                Caption = 'Welcome to Expense Management';

                field(WelcomeText; 'Welcome to the Business Central Expense Management system! This guide will help you get started quickly.')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                    Style = Strong;
                }
            }

            group(QuickStart)
            {
                Caption = 'Quick Start - 3 Easy Steps';

                field(Step1; '1. Run the Setup Wizard')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Mgmt Setup Wizard");
                    end;
                }

                field(Step1Desc; 'Configure number series, create master data, and set up essential settings.')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }

                field(Step2; '2. Review Setup Checklist')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Setup Checklist");
                    end;
                }

                field(Step2Desc; 'Verify that all required setup items are complete and configure optional features.')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }

                field(Step3; '3. Start Using the System')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Management Menu");
                    end;
                }

                field(Step3Desc; 'Create your first expense report and explore the features.')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }
            }

            group(KeyFeatures)
            {
                Caption = 'Key Features';

                field(Feature1; '📝 Expense Report Management')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Reports List");
                    end;
                }

                field(Feature2; '💳 Multiple Payment Methods')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Payment Methods List");
                    end;
                }

                field(Feature3; '📊 Expense Categories & Policies')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Categories List");
                    end;
                }

                field(Feature4; '🧾 Receipt Management')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Receipts List");
                    end;
                }

                field(Feature5; '👥 Employee & Per Diem Management')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Employees List");
                    end;
                }
            }

            group(CommonTasks)
            {
                Caption = 'Common Tasks';

                field(Task1; 'Create New Expense Report')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Report Card");
                    end;
                }

                field(Task2; 'View My Expense Reports')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"My Expense Reports List");
                    end;
                }

                field(Task3; 'Manage Expense Categories')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Categories List");
                    end;
                }

                field(Task4; 'Configure Payment Methods')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Payment Methods List");
                    end;
                }
            }

            group(DemoData)
            {
                Caption = 'Demo Data (Optional)';

                field(DemoInfo; 'Want to explore the system with sample data? Create demo data to see how everything works.')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    MultiLine = true;
                }

                field(CreateDemo; 'Create Demo Data')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = StandardAccent;
                    StyleExpr = true;

                    trigger OnDrillDown()
                    begin
                        Page.RunModal(Page::"Expense Demo Data Setup");
                    end;
                }
            }

            group(Support)
            {
                Caption = 'Support & Resources';

                field(SupportInfo; 'Need help? Check these resources:')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                }

                field(CheckSetupStatus; '• Check Setup Status')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Setup Checklist");
                    end;
                }

                field(OpenMainMenu; '• Open Main Menu')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Management Menu");
                    end;
                }

                field(ManageSetup; '• Manage Setup Settings')
                {
                    ApplicationArea = All;
                    ShowCaption = false;
                    Style = Subordinate;

                    trigger OnDrillDown()
                    begin
                        Page.Run(Page::"Expense Management Setup");
                    end;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(RunSetupWizard)
            {
                ApplicationArea = All;
                Caption = 'Run Setup Wizard';
                Image = SetupColumns;
                ToolTip = 'Start the guided setup wizard to configure the system.';

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Expense Mgmt Setup Wizard");
                end;
            }

            action(ViewChecklist)
            {
                ApplicationArea = All;
                Caption = 'View Setup Checklist';
                Image = CheckList;
                ToolTip = 'Review the setup checklist to ensure all configuration is complete.';

                trigger OnAction()
                begin
                    Page.Run(Page::"Expense Setup Checklist");
                end;
            }

            action(CreateDemoData)
            {
                ApplicationArea = All;
                Caption = 'Create Demo Data';
                Image = CreateDocument;
                ToolTip = 'Create sample data for demonstration and learning purposes.';

                trigger OnAction()
                begin
                    Page.RunModal(Page::"Expense Demo Data Setup");
                end;
            }
        }
    }
}
