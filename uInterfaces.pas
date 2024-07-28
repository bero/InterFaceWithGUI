unit uInterfaces;

interface

type
  ITestDlg = interface
  ['{E80A465B-6908-47B7-AC12-0835D4DE79AD}']
    function Execute(const AName: string): string;
  end;

implementation

end.
