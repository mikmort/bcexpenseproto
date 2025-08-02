codeunit 50199 "Expense Demo Data Setup"
{
    trigger OnRun()
    begin
        CreateAllData();
    end;

    procedure CreateAllData()
    begin
        CreateSetupData();
        CreateDemoData();
    end;

    procedure CreateSetupDataOnly()
    var
        SetupDataCodeunit: Codeunit "Expense Setup Data";
    begin
        SetupDataCodeunit.Run();
    end;

    procedure CreateDemoDataOnly()
    var
        DemoDataCodeunit: Codeunit "Expense Demo Data";
    begin
        DemoDataCodeunit.Run();
    end;

    local procedure CreateSetupData()
    var
        SetupDataCodeunit: Codeunit "Expense Setup Data";
    begin
        SetupDataCodeunit.Run();
    end;

    local procedure CreateDemoData()
    var
        DemoDataCodeunit: Codeunit "Expense Demo Data";
    begin
        DemoDataCodeunit.Run();
    end;
}
