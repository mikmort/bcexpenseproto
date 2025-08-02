page 50168 "Expense Management Setup"
{
    PageType = Card;
    SourceTable = "Expense Management Setup";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Setup Id"; Rec."Setup Id")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
            }

            group(NumberSeries)
            {
                Caption = 'Number Series';

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

            group(Features)
            {
                Caption = 'Features';

                field("Enable Expense Agent"; Rec."Enable Expense Agent")
                {
                    ApplicationArea = All;
                    ToolTip = 'Enables the expense agent for automated processing.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CreateSetupData)
            {
                ApplicationArea = All;
                Caption = 'Create Setup Data';
                ToolTip = 'Creates default setup data including number series, categories, payment methods, and other configuration.';
                Image = Setup;

                trigger OnAction()
                var
                    SetupData: Codeunit "Expense Setup Data";
                    IntegerRec: Record Integer;
                begin
                    SetupData.Run(IntegerRec);
                    CurrPage.Update();
                end;
            }
        }
    }

    var
        NoSeriesRec: Record "No. Series";
}


