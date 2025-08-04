codeunit 50198 "Expense Demo Data"
{
    // Codeunit to create demo/example data for the Expense Management system
    // This data represents sample transactions for demonstration purposes only
    TableNo = "Integer";

    trigger OnRun()
    begin
        CreateDemoData();
    end;

    local procedure CreateDemoData()
    begin
        CreateDemoEmployees();
        CreateDemoExpenseReports();
        CreateDemoExpenseReportLines();
        CreateDemoExpenseReceipts();
        CreateDemoExpenseComments();
        CreateDemoExpenseItemizations();
        CreateDemoExpenseItemizationLines();
        CreateDemoExpenseParticipants();
        CreateDemoPerDiemExpenses();

        Message('Demo data creation completed successfully!');
    end;

    local procedure GetValidDate(DaysOffset: Integer): Date
    var
        TargetDate: Date;
        TargetMonth: Integer;
    begin
        // Calculate the target date
        TargetDate := Today() + DaysOffset;
        TargetMonth := Date2DMY(TargetDate, 2);

        // Check if the month is allowed (11, 12, 01, 02)
        if TargetMonth in [1, 2, 11, 12] then
            exit(TargetDate);

        // If current date is not in allowed range, find the nearest valid date
        // If we're in month 3-10, use February of current year
        if TargetMonth in [3, 4, 5, 6, 7, 8, 9, 10] then
            exit(DMY2Date(15, 2, Date2DMY(TargetDate, 3)));

        // Default fallback to February 15 of current year
        exit(DMY2Date(15, 2, Date2DMY(Today(), 3)));
    end;

    local procedure GetValidDateInPast(DaysAgo: Integer): Date
    begin
        exit(GetValidDate(-DaysAgo));
    end;

    local procedure CreateDemoEmployees()
    var
        Employee: Record Employee;
    begin
        // Create sample employees for demonstration using built-in Employee table
        if not Employee.Get('EMP001') then begin
            Employee.Init();
            Employee."No." := 'EMP001';
            Employee."First Name" := 'John';
            Employee."Last Name" := 'Smith';
            Employee."E-Mail" := 'john.smith@company.com';
            Employee.Insert();
        end;

        if not Employee.Get('EMP002') then begin
            Employee.Init();
            Employee."No." := 'EMP002';
            Employee."First Name" := 'Sarah';
            Employee."Last Name" := 'Johnson';
            Employee."E-Mail" := 'sarah.johnson@company.com';
            Employee.Insert();
        end;

        if not Employee.Get('EMP003') then begin
            Employee.Init();
            Employee."No." := 'EMP003';
            Employee."First Name" := 'Michael';
            Employee."Last Name" := 'Brown';
            Employee."E-Mail" := 'michael.brown@company.com';
            Employee.Insert();
        end;

        if not Employee.Get('EMP004') then begin
            Employee.Init();
            Employee."No." := 'EMP004';
            Employee."First Name" := 'Emily';
            Employee."Last Name" := 'Davis';
            Employee."E-Mail" := 'emily.davis@company.com';
            Employee.Insert();
        end;

        if not Employee.Get('EMP005') then begin
            Employee.Init();
            Employee."No." := 'EMP005';
            Employee."First Name" := 'David';
            Employee."Last Name" := 'Wilson';
            Employee."E-Mail" := 'david.wilson@company.com';
            Employee.Insert();
        end;
    end;

    local procedure CreateDemoExpenseReports()
    var
        Report: Record "Expense Reports";
    begin
        // Sample expense reports for demonstration
        if not Report.Get('EXP-2025-001') then begin
            Report.Init();
            Report."Report Id" := 'EXP-2025-001';
            Report."Employee Id" := 'EMP001';
            Report.Purpose := 'Client Meeting - NYC';
            Report.Destination := 'New York City, NY';
            Report."Report Date" := GetValidDateInPast(30);
            Report."Posting Date" := GetValidDateInPast(25);
            Report."Currency Code" := 'USD';
            Report."Total Amount" := 1250.00;
            Report.Status := "Expense Status"::Submitted;
            Report."Payment Method Code" := 'PERSONAL';
            Report."Receipts Attached" := true;
            Report."Created By" := UserId();
            Report."Created Date Time" := CurrentDateTime() - 720000; // 30 days ago
            Report.Insert();
        end;

        if not Report.Get('EXP-2025-002') then begin
            Report.Init();
            Report."Report Id" := 'EXP-2025-002';
            Report."Employee Id" := 'EMP002';
            Report.Purpose := 'Technical Conference - Chicago';
            Report.Destination := 'Chicago, IL';
            Report."Report Date" := GetValidDateInPast(20);
            Report."Posting Date" := GetValidDateInPast(15);
            Report."Currency Code" := 'USD';
            Report."Total Amount" := 980.50;
            Report.Status := "Expense Status"::Approved;
            Report."Payment Method Code" := 'CORP-CARD';
            Report."Receipts Attached" := true;
            Report."Created By" := UserId();
            Report."Created Date Time" := CurrentDateTime() - 480000; // 20 days ago
            Report.Insert();
        end;

        if not Report.Get('EXP-2025-003') then begin
            Report.Init();
            Report."Report Id" := 'EXP-2025-003';
            Report."Employee Id" := 'EMP003';
            Report.Purpose := 'European Sales Meeting';
            Report.Destination := 'London, UK';
            Report."Report Date" := GetValidDateInPast(10);
            Report."Posting Date" := GetValidDateInPast(5);
            Report."Currency Code" := 'GBP';
            Report."Total Amount" := 875.25;
            Report.Status := "Expense Status"::Draft;
            Report."Payment Method Code" := 'PERSONAL';
            Report."Receipts Attached" := false;
            Report."Created By" := UserId();
            Report."Created Date Time" := CurrentDateTime() - 240000; // 10 days ago
            Report.Insert();
        end;

        if not Report.Get('EXP-2025-004') then begin
            Report.Init();
            Report."Report Id" := 'EXP-2025-004';
            Report."Employee Id" := 'EMP004';
            Report.Purpose := 'Office Supplies Purchase';
            Report.Destination := 'Local Office';
            Report."Report Date" := GetValidDateInPast(5);
            Report."Posting Date" := GetValidDateInPast(2);
            Report."Currency Code" := 'USD';
            Report."Total Amount" := 125.75;
            Report.Status := "Expense Status"::Submitted;
            Report."Payment Method Code" := 'CASH';
            Report."Receipts Attached" := true;
            Report."Created By" := UserId();
            Report."Created Date Time" := CurrentDateTime() - 120000; // 5 days ago
            Report.Insert();
        end;
    end;

    local procedure CreateDemoExpenseReportLines()
    var
        Line: Record "Expense Report Lines";
        LineId: Integer;
    begin
        LineId := 1;

        // Lines for EXP-2025-001 (John Smith - NYC Client Meeting)
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-001';
            Line."Line Number" := 10000;
            Line."Expense Date" := GetValidDateInPast(30);
            Line."Category Code" := 'AIRFARE';
            Line."Subcategory Code" := 'DOMESTIC';
            Line."Currency Code" := 'USD';
            Line.Amount := 450.00;
            Line."Tax Amount" := 0.00;
            Line."Reimbursable Amount" := 450.00;
            Line."Expense Location Code" := 'NYC';
            Line."Payment Method Code" := 'PERSONAL';
            Line."Receipt Required" := true;
            Line.Description := 'Flight to New York for client meeting';
            Line.Status := "Expense Status"::Approved;
            Line.Insert();
        end;

        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-001';
            Line."Line Number" := 20000;
            Line."Expense Date" := GetValidDateInPast(29);
            Line."Category Code" := 'HOTEL';
            Line."Currency Code" := 'USD';
            Line.Amount := 320.00;
            Line."Tax Amount" := 25.60;
            Line."Reimbursable Amount" := 320.00;
            Line."Expense Location Code" := 'NYC';
            Line."Payment Method Code" := 'PERSONAL';
            Line."Receipt Required" := true;
            Line.Description := 'Hotel accommodation - 2 nights';
            Line.Status := "Expense Status"::Approved;
            Line.Insert();
        end;

        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-001';
            Line."Line Number" := 30000;
            Line."Expense Date" := GetValidDateInPast(29);
            Line."Category Code" := 'MEALS';
            Line."Subcategory Code" := 'DINNER';
            Line."Currency Code" := 'USD';
            Line.Amount := 85.00;
            Line."Tax Amount" := 6.80;
            Line."Reimbursable Amount" := 85.00;
            Line."Expense Location Code" := 'NYC';
            Line."Payment Method Code" := 'PERSONAL';
            Line."Receipt Required" := true;
            Line.Description := 'Business dinner with client';
            Line.Status := "Expense Status"::Approved;
            Line.Insert();
        end;

        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-001';
            Line."Line Number" := 40000;
            Line."Expense Date" := GetValidDateInPast(28);
            Line."Category Code" := 'TAXI';
            Line."Currency Code" := 'USD';
            Line.Amount := 45.00;
            Line."Tax Amount" := 3.60;
            Line."Reimbursable Amount" := 45.00;
            Line."Expense Location Code" := 'NYC';
            Line."Payment Method Code" := 'PERSONAL';
            Line."Receipt Required" := true;
            Line.Description := 'Airport transfers and local transportation';
            Line.Status := "Expense Status"::Approved;
            Line.Insert();
        end;

        // Lines for EXP-2025-002 (Sarah Johnson - Chicago Conference)
        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-002';
            Line."Line Number" := 10000;
            Line."Expense Date" := GetValidDateInPast(20);
            Line."Category Code" := 'TRAINING';
            Line."Subcategory Code" := 'CONFERENCE';
            Line."Currency Code" := 'USD';
            Line.Amount := 650.00;
            Line."Tax Amount" := 0.00;
            Line."Reimbursable Amount" := 650.00;
            Line."Expense Location Code" := 'CHI';
            Line."Payment Method Code" := 'CORP-CARD';
            Line."Receipt Required" := true;
            Line.Description := 'TechCon 2025 registration fee';
            Line.Status := "Expense Status"::Approved;
            Line.Insert();
        end;

        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-002';
            Line."Line Number" := 20000;
            Line."Expense Date" := GetValidDateInPast(19);
            Line."Category Code" := 'TAXI';
            Line."Currency Code" := 'USD';
            Line.Amount := 35.50;
            Line."Tax Amount" := 2.84;
            Line."Reimbursable Amount" := 35.50;
            Line."Expense Location Code" := 'CHI';
            Line."Payment Method Code" := 'CORP-CARD';
            Line."Receipt Required" := true;
            Line.Description := 'Airport taxi';
            Line.Status := "Expense Status"::Approved;
            Line.Insert();
        end;

        // Line for EXP-2025-004 (Emily Davis - Office Supplies)
        LineId += 1;
        if not Line.Get(LineId) then begin
            Line.Init();
            Line."Line Id" := LineId;
            Line."Report Id" := 'EXP-2025-004';
            Line."Line Number" := 10000;
            Line."Expense Date" := GetValidDateInPast(5);
            Line."Category Code" := 'OFFICE-SUPPLY';
            Line."Currency Code" := 'USD';
            Line.Amount := 125.75;
            Line."Tax Amount" := 10.06;
            Line."Reimbursable Amount" := 125.75;
            Line."Expense Location Code" := '';
            Line."Payment Method Code" := 'CASH';
            Line."Receipt Required" := true;
            Line.Description := 'Printer paper, pens, and folders';
            Line.Status := "Expense Status"::Submitted;
            Line.Insert();
        end;
    end;

    local procedure CreateDemoExpenseReceipts()
    var
        Receipt: Record "Expense Receipts";
        ReceiptId: Integer;
    begin
        ReceiptId := 1;

        // Receipt for airfare
        if not Receipt.Get(ReceiptId) then begin
            Receipt.Init();
            Receipt."Receipt Id" := ReceiptId;
            Receipt."Line Id" := 1; // Airfare line
            Receipt."File Name" := 'airline_receipt_001.pdf';
            Receipt."File Uri" := 'https://storage.company.com/receipts/airline_receipt_001.pdf';
            Receipt."Uploaded Date Time" := CurrentDateTime() - 720000;
            Receipt."Amount On Receipt" := 450.00;
            Receipt."Currency Code" := 'USD';
            Receipt.Insert();
        end;

        ReceiptId += 1;
        // Receipt for hotel
        if not Receipt.Get(ReceiptId) then begin
            Receipt.Init();
            Receipt."Receipt Id" := ReceiptId;
            Receipt."Line Id" := 2; // Hotel line
            Receipt."File Name" := 'hotel_receipt_002.pdf';
            Receipt."File Uri" := 'https://storage.company.com/receipts/hotel_receipt_002.pdf';
            Receipt."Uploaded Date Time" := CurrentDateTime() - 696000;
            Receipt."Amount On Receipt" := 345.60; // Includes tax
            Receipt."Currency Code" := 'USD';
            Receipt.Insert();
        end;

        ReceiptId += 1;
        // Receipt for business dinner
        if not Receipt.Get(ReceiptId) then begin
            Receipt.Init();
            Receipt."Receipt Id" := ReceiptId;
            Receipt."Line Id" := 3; // Meals line
            Receipt."File Name" := 'restaurant_receipt_003.jpg';
            Receipt."File Uri" := 'https://storage.company.com/receipts/restaurant_receipt_003.jpg';
            Receipt."Uploaded Date Time" := CurrentDateTime() - 696000;
            Receipt."Amount On Receipt" := 91.80; // Includes tax and tip
            Receipt."Currency Code" := 'USD';
            Receipt.Insert();
        end;
    end;

    local procedure CreateDemoExpenseComments()
    var
        Comment: Record "Expense Comments";
        CommentId: Integer;
    begin
        CommentId := 1;

        // Comment from approver on business dinner
        if not Comment.Get(CommentId) then begin
            Comment.Init();
            Comment."Comment Id" := CommentId;
            Comment."Report Id" := 'EXP-2025-001';
            Comment."Line Id" := 3; // Business dinner line
            Comment."Comment Text" := 'Please provide business justification for this dinner expense.';
            Comment."Comment Date Time" := CurrentDateTime() - 600000;
            Comment."Created By" := 'MANAGER001';
            Comment.Insert();
        end;

        CommentId += 1;
        // Response from employee
        if not Comment.Get(CommentId) then begin
            Comment.Init();
            Comment."Comment Id" := CommentId;
            Comment."Report Id" := 'EXP-2025-001';
            Comment."Line Id" := 3; // Business dinner line
            Comment."Comment Text" := 'Dinner meeting with potential client ABC Corp to discuss Q2 contract. Attendees listed in participants.';
            Comment."Comment Date Time" := CurrentDateTime() - 480000;
            Comment."Created By" := 'EMP001';
            Comment.Insert();
        end;

        CommentId += 1;
        // General report comment
        if not Comment.Get(CommentId) then begin
            Comment.Init();
            Comment."Comment Id" := CommentId;
            Comment."Report Id" := 'EXP-2025-002';
            Comment."Line Id" := 0; // Report level comment
            Comment."Comment Text" := 'Conference was excellent - learned new development methodologies that will benefit our team.';
            Comment."Comment Date Time" := CurrentDateTime() - 360000;
            Comment."Created By" := 'EMP002';
            Comment.Insert();
        end;
    end;

    local procedure CreateDemoExpenseItemizations()
    var
        Itemization: Record "Expense Itemizations";
    begin
        // Itemization for business dinner
        if not Itemization.Get(1) then begin
            Itemization.Init();
            Itemization."Itemization Id" := 1;
            Itemization."Line Id" := 3; // Business dinner line
            Itemization."Total Amount" := 85.00;
            Itemization."Total Reimbursable Amount" := 85.00;
            Itemization.Insert();
        end;
    end;

    local procedure CreateDemoExpenseItemizationLines()
    var
        ItemLine: Record "Expense Itemization Lines";
        LineId: Integer;
    begin
        LineId := 1;

        // Appetizers
        if not ItemLine.Get(LineId) then begin
            ItemLine.Init();
            ItemLine."Itemization Line Id" := LineId;
            ItemLine."Itemization Id" := 1;
            ItemLine."Start Date" := GetValidDateInPast(29);
            ItemLine."End Date" := GetValidDateInPast(29);
            ItemLine.Amount := 18.00;
            ItemLine.Description := 'Appetizers for 3 people';
            ItemLine."Expense Location Code" := 'NYC';
            ItemLine.Insert();
        end;

        LineId += 1;
        // Main courses
        if not ItemLine.Get(LineId) then begin
            ItemLine.Init();
            ItemLine."Itemization Line Id" := LineId;
            ItemLine."Itemization Id" := 1;
            ItemLine."Start Date" := GetValidDateInPast(29);
            ItemLine."End Date" := GetValidDateInPast(29);
            ItemLine.Amount := 54.00;
            ItemLine.Description := 'Main courses for 3 people';
            ItemLine."Expense Location Code" := 'NYC';
            ItemLine.Insert();
        end;

        LineId += 1;
        // Beverages
        if not ItemLine.Get(LineId) then begin
            ItemLine.Init();
            ItemLine."Itemization Line Id" := LineId;
            ItemLine."Itemization Id" := 1;
            ItemLine."Start Date" := GetValidDateInPast(29);
            ItemLine."End Date" := GetValidDateInPast(29);
            ItemLine.Amount := 13.00;
            ItemLine.Description := 'Beverages and coffee';
            ItemLine."Expense Location Code" := 'NYC';
            ItemLine.Insert();
        end;
    end;

    local procedure CreateDemoExpenseParticipants()
    var
        Participant: Record "Expense Participants";
        ParticipantId: Integer;
    begin
        ParticipantId := 1;

        // Business dinner participants
        if not Participant.Get(ParticipantId) then begin
            Participant.Init();
            Participant."Participant Id" := ParticipantId;
            Participant."Line Id" := 3; // Business dinner line
            Participant."Participant Name" := 'John Smith (Employee)';
            Participant."Participant Type" := 'Employee';
            Participant.Insert();
        end;

        ParticipantId += 1;
        if not Participant.Get(ParticipantId) then begin
            Participant.Init();
            Participant."Participant Id" := ParticipantId;
            Participant."Line Id" := 3; // Business dinner line
            Participant."Participant Name" := 'Jane Wilson (ABC Corp)';
            Participant."Participant Type" := 'Client';
            Participant.Insert();
        end;

        ParticipantId += 1;
        if not Participant.Get(ParticipantId) then begin
            Participant.Init();
            Participant."Participant Id" := ParticipantId;
            Participant."Line Id" := 3; // Business dinner line
            Participant."Participant Name" := 'Bob Johnson (ABC Corp)';
            Participant."Participant Type" := 'Client';
            Participant.Insert();
        end;
    end;

    local procedure CreateDemoPerDiemExpenses()
    var
        PerDiem: Record "Per Diem Expenses";
        PerDiemId: Integer;
    begin
        PerDiemId := 1;

        // Per diem for NYC trip
        if not PerDiem.Get(PerDiemId) then begin
            PerDiem.Init();
            PerDiem."Per Diem Id" := PerDiemId;
            PerDiem."Line Id" := 3; // Related to meals line
            PerDiem."Employee Id" := 'EMP001';
            PerDiem."Expense Date" := GetValidDateInPast(29);
            PerDiem."Expense Location Code" := 'NYC';
            PerDiem."Daily Rate" := 85.00; // NYC daily meal rate
            PerDiem."Itemized Amount" := 85.00;
            PerDiem.Insert();
        end;

        PerDiemId += 1;
        // Per diem for Chicago trip
        if not PerDiem.Get(PerDiemId) then begin
            PerDiem.Init();
            PerDiem."Per Diem Id" := PerDiemId;
            PerDiem."Line Id" := 0; // General per diem
            PerDiem."Employee Id" := 'EMP002';
            PerDiem."Expense Date" := GetValidDateInPast(20);
            PerDiem."Expense Location Code" := 'CHI';
            PerDiem."Daily Rate" := 60.00; // Standard US daily meal rate
            PerDiem."Itemized Amount" := 60.00;
            PerDiem.Insert();
        end;
    end;
}
