page 50199 "Expense Management Setup Wizard"
{
    PageType = NavigatePage;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Expense Management Setup Wizard';
    SourceTable = "Expense Management Setup";

    layout
    {
        area(content)
        {
            group(BannerGroup)
            {
                Editable = false;
                ShowCaption = false;
                Visible = TopBannerVisible;

                field(MediaResourcesStandard; MediaResourcesStandard."Media Reference")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ShowCaption = false;
                }
            }

            group(Step1)
            {
                Visible = Step1Visible;
                ShowCaption = false;

                group("Para1.1")
                {
                    Caption = 'Welcome to Expense Management Setup';
                    InstructionalText = 'This wizard will help you set up the Expense Management system. You''ll configure number series, default categories, posting groups, and other essential settings.';
                }
                group("Para1.2")
                {
                    Caption = 'Let''s get started';
                    InstructionalText = 'Choose Next to begin the setup process.';
                }
            }

            group(Step2)
            {
                Visible = Step2Visible;
                ShowCaption = false;

                group("Para2.1")
                {
                    Caption = 'Number Series Configuration';
                    InstructionalText = 'Configure the number series that will be used for expense reports and posted expense reports.';

                    field("Expense Report No. Sequence"; Rec."Expense Report No. Sequence")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the number series for expense reports.';

                        trigger OnAssistEdit()
                        var
                            NoSeries: Page "No. Series";
                        begin
                            NoSeries.LookupMode(true);
                            if NoSeries.RunModal() = Action::LookupOK then begin
                                NoSeries.GetRecord(NoSeriesRec);
                                Rec."Expense Report No. Sequence" := NoSeriesRec.Code;
                            end;
                        end;
                    }
                    field("Posted Expense Report No Seq."; Rec."Posted Expense Report No Seq.")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Specifies the number series for posted expense reports.';

                        trigger OnAssistEdit()
                        var
                            NoSeries: Page "No. Series";
                        begin
                            NoSeries.LookupMode(true);
                            if NoSeries.RunModal() = Action::LookupOK then begin
                                NoSeries.GetRecord(NoSeriesRec);
                                Rec."Posted Expense Report No Seq." := NoSeriesRec.Code;
                            end;
                        end;
                    }
                }

                group("Para2.2")
                {
                    Caption = 'Quick Setup';
                    InstructionalText = 'Click "Create Default Number Series" to automatically create standard number series for expense reports.';

                    field(CreateDefaultNumberSeries; '')
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Style = StandardAccent;
                        StyleExpr = true;

                        trigger OnDrillDown()
                        begin
                            CreateDefaultNumberSeries();
                        end;
                    }
                }
            }

            group(Step3)
            {
                Visible = Step3Visible;
                ShowCaption = false;

                group("Para3.1")
                {
                    Caption = 'Master Data Setup';
                    InstructionalText = 'Create the essential master data for your expense management system including categories, posting groups, and payment methods.';
                }

                group("Para3.2")
                {
                    Caption = 'Default Data Creation';

                    field(CreateMasterData; CreateMasterDataText)
                    {
                        ApplicationArea = All;
                        Caption = 'Create Default Master Data';
                        ToolTip = 'Creates default expense categories, posting groups, payment methods, and other master data.';
                        Editable = false;
                        Style = StandardAccent;
                        StyleExpr = true;

                        trigger OnDrillDown()
                        begin
                            CreateDefaultMasterData();
                        end;
                    }

                    field(MasterDataStatus; MasterDataStatusText)
                    {
                        ApplicationArea = All;
                        Caption = 'Status';
                        Editable = false;
                        Style = Subordinate;
                    }
                }
            }

            group(Step4)
            {
                Visible = Step4Visible;
                ShowCaption = false;

                group("Para4.1")
                {
                    Caption = 'Features and Options';
                    InstructionalText = 'Configure additional features and options for the expense management system.';

                    field("Enable Expense Agent"; Rec."Enable Expense Agent")
                    {
                        ApplicationArea = All;
                        ToolTip = 'Enables the expense agent for automated processing.';
                    }
                }

                group("Para4.2")
                {
                    Caption = 'Demo Data (Optional)';
                    InstructionalText = 'You can create demo data to help you learn and test the system. This includes sample employees, expense reports, and transactions.';

                    field(CreateDemoData; CreateDemoDataText)
                    {
                        ApplicationArea = All;
                        Caption = 'Create Demo Data';
                        ToolTip = 'Creates sample data for demonstration and training purposes.';
                        Editable = false;
                        Style = StandardAccent;
                        StyleExpr = true;

                        trigger OnDrillDown()
                        begin
                            CreateDemoData();
                        end;
                    }

                    field(DemoDataStatus; DemoDataStatusText)
                    {
                        ApplicationArea = All;
                        Caption = 'Status';
                        Editable = false;
                        Style = Subordinate;
                    }
                }
            }

            group(Step5)
            {
                Visible = Step5Visible;
                ShowCaption = false;

                group("Para5.1")
                {
                    Caption = 'Setup Complete!';
                    InstructionalText = 'Congratulations! You have successfully configured the Expense Management system.';
                }

                group("Para5.2")
                {
                    Caption = 'Next Steps';
                    InstructionalText = 'You can now start using the expense management system. Access it from the Expense Management role center or through the navigation menu.';
                }

                group("Para5.3")
                {
                    Caption = 'Quick Actions';

                    field(OpenRoleCenter; 'Open Expense Management Role Center')
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Style = StandardAccent;
                        StyleExpr = true;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Expense Management Menu");
                        end;
                    }

                    field(OpenSetup; 'Open Setup Page')
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        Editable = false;
                        Style = Subordinate;
                        StyleExpr = true;

                        trigger OnDrillDown()
                        begin
                            Page.Run(Page::"Expense Management Setup");
                        end;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(ActionBack)
            {
                ApplicationArea = All;
                Caption = 'Back';
                Enabled = BackActionEnabled;
                Image = PreviousRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    NextStep(true);
                end;
            }
            action(ActionNext)
            {
                ApplicationArea = All;
                Caption = 'Next';
                Enabled = NextActionEnabled;
                Image = NextRecord;
                InFooterBar = true;

                trigger OnAction()
                begin
                    NextStep(false);
                end;
            }
            action(ActionFinish)
            {
                ApplicationArea = All;
                Caption = 'Finish';
                Enabled = FinishActionEnabled;
                Image = Approve;
                InFooterBar = true;

                trigger OnAction()
                begin
                    FinishAction();
                end;
            }
        }
    }

    trigger OnInit()
    begin
        LoadTopBanners();
    end;

    trigger OnOpenPage()
    begin
        Step := Step::Start;
        EnableControls();
        GetSetupRecord();
    end;

    var
        MediaRepositoryStandard: Record "Media Repository";
        MediaResourcesStandard: Record "Media Resources";
        NoSeriesRec: Record "No. Series";
        Step: Option Start,NumberSeries,MasterData,Features,Finish;
        TopBannerVisible: Boolean;
        Step1Visible: Boolean;
        Step2Visible: Boolean;
        Step3Visible: Boolean;
        Step4Visible: Boolean;
        Step5Visible: Boolean;
        BackActionEnabled: Boolean;
        NextActionEnabled: Boolean;
        FinishActionEnabled: Boolean;
        CreateMasterDataText: Text;
        MasterDataStatusText: Text;
        CreateDemoDataText: Text;
        DemoDataStatusText: Text;

    local procedure EnableControls()
    begin
        ResetControls();

        case Step of
            Step::Start:
                ShowStep1();
            Step::NumberSeries:
                ShowStep2();
            Step::MasterData:
                ShowStep3();
            Step::Features:
                ShowStep4();
            Step::Finish:
                ShowStep5();
        end;
    end;

    local procedure ShowStep1()
    begin
        Step1Visible := true;
        BackActionEnabled := false;
        NextActionEnabled := true;
        FinishActionEnabled := false;
    end;

    local procedure ShowStep2()
    begin
        Step2Visible := true;
        BackActionEnabled := true;
        NextActionEnabled := true;
        FinishActionEnabled := false;
    end;

    local procedure ShowStep3()
    begin
        Step3Visible := true;
        BackActionEnabled := true;
        NextActionEnabled := true;
        FinishActionEnabled := false;
        
        CreateMasterDataText := 'Click here to create default master data';
        MasterDataStatusText := 'Not created';
    end;

    local procedure ShowStep4()
    begin
        Step4Visible := true;
        BackActionEnabled := true;
        NextActionEnabled := true;
        FinishActionEnabled := false;
        
        CreateDemoDataText := 'Click here to create demo data';
        DemoDataStatusText := 'Not created';
    end;

    local procedure ShowStep5()
    begin
        Step5Visible := true;
        BackActionEnabled := true;
        NextActionEnabled := false;
        FinishActionEnabled := true;
    end;

    local procedure ResetControls()
    begin
        Step1Visible := false;
        Step2Visible := false;
        Step3Visible := false;
        Step4Visible := false;
        Step5Visible := false;
    end;

    local procedure NextStep(Backwards: Boolean)
    begin
        if Backwards then begin
            Step := Step - 1;
        end else begin
            if Step = Step::NumberSeries then
                ValidateNumberSeries();
            Step := Step + 1;
        end;

        EnableControls();
    end;

    local procedure ValidateNumberSeries()
    begin
        if (Rec."Expense Report No. Sequence" = '') or (Rec."Posted Expense Report No Seq." = '') then
            Error('Please configure both number series before continuing.');
    end;

    local procedure FinishAction()
    begin
        Rec.Modify();
        CurrPage.Close();
    end;

    local procedure GetSetupRecord()
    begin
        if not Rec.Get(1) then begin
            Rec.Init();
            Rec."Setup Id" := 1;
            Rec.Insert();
        end;
    end;

    local procedure LoadTopBanners()
    begin
        if MediaRepositoryStandard.Get('AssistedSetup-NoText-400px.png', Format(ClientType())) then
            if MediaResourcesStandard.Get(MediaRepositoryStandard."Media Resources Ref") then
                TopBannerVisible := MediaResourcesStandard."Media Reference".HasValue();
    end;

    local procedure CreateDefaultNumberSeries()
    var
        NoSeries: Record "No. Series";
        NoSeriesLine: Record "No. Series Line";
    begin
        // Create Expense Report Number Series
        if not NoSeries.Get('EXPR') then begin
            NoSeries.Init();
            NoSeries.Code := 'EXPR';
            NoSeries.Description := 'Expense Reports';
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert();

            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := 'EXPR';
            NoSeriesLine."Line No." := 10000;
            NoSeriesLine."Starting No." := 'EXPR-000001';
            NoSeriesLine."Ending No." := 'EXPR-999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Insert();
        end;

        // Create Posted Expense Report Number Series
        if not NoSeries.Get('P-EXPR') then begin
            NoSeries.Init();
            NoSeries.Code := 'P-EXPR';
            NoSeries.Description := 'Posted Expense Reports';
            NoSeries."Default Nos." := true;
            NoSeries."Manual Nos." := false;
            NoSeries.Insert();

            NoSeriesLine.Init();
            NoSeriesLine."Series Code" := 'P-EXPR';
            NoSeriesLine."Line No." := 10000;
            NoSeriesLine."Starting No." := 'P-EXPR-000001';
            NoSeriesLine."Ending No." := 'P-EXPR-999999';
            NoSeriesLine."Increment-by No." := 1;
            NoSeriesLine.Insert();
        end;

        // Update setup record
        Rec."Expense Report No. Sequence" := 'EXPR';
        Rec."Posted Expense Report No Seq." := 'P-EXPR';
        
        Message('Default number series created successfully!');
    end;

    local procedure CreateDefaultMasterData()
    var
        SetupData: Codeunit "Expense Setup Data";
        IntegerRec: Record Integer;
    begin
        SetupData.Run(IntegerRec);
        MasterDataStatusText := 'Created successfully';
        CreateMasterDataText := 'Master data created';
    end;

    local procedure CreateDemoData()
    var
        DemoData: Codeunit "Expense Demo Data";
        IntegerRec: Record Integer;
    begin
        DemoData.Run(IntegerRec);
        DemoDataStatusText := 'Created successfully';
        CreateDemoDataText := 'Demo data created';
    end;
}
