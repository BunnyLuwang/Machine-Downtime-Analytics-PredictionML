SELECT * FROM new_project.machinedowntime;

select count(*) from machinedowntime;
describe new_project.machinedowntime;

 -- first 5 rows of dataset
select * from machinedowntime limit 5; 

-- last 5 rows by order of id
select * from machinedowntime order by `Machine_ID` desc limit 5; 

-- random 5 rows
select * from machinedowntime order by rand() limit 5;

-- count of machines
select count(Machine_ID) from machinedowntime;

-- count unique machines
select count(distinct Machine_ID) as machines from machinedowntime;

-- count unique assembly line nos.
select count(distinct Assembly_Line_No) as line_no from machinedowntime;

-- check duplicate rows
select `Hydraulic_Pressure(bar)`, `Coolant_Pressure(bar)`, `Air_System_Pressure(bar)`, Coolant_Temperature, `Hydraulic_Oil_Temperature(Â°C)`, `Spindle_Bearing_Temperature(Â°C)`, `Spindle_Vibration(Âµm)`, `Tool_Vibration(Âµm)`, `Spindle_Speed(RPM)`, `Voltage(volts)`, `Torque(Nm)`, `Cutting(kN)` , count(*) 
from machinedowntime
group by `Hydraulic_Pressure(bar)`, `Coolant_Pressure(bar)`, `Air_System_Pressure(bar)`, Coolant_Temperature, `Hydraulic_Oil_Temperature(Â°C)`, `Spindle_Bearing_Temperature(Â°C)`, `Spindle_Vibration(Âµm)`, `Tool_Vibration(Âµm)`, `Spindle_Speed(RPM)`, `Voltage(volts)`, `Torque(Nm)`, `Cutting(kN)`
having count(*) > 1;

-- count null values of each column

select count(*) as hp from machinedowntime where `Hydraulic_Pressure(bar)` is null or `Hydraulic_Pressure(bar)` =' ';
select count(*) as cp from machinedowntime where `Coolant_Pressure(bar)` is null or `Coolant_Pressure(bar)`=' ';
select count(*) as asp from machinedowntime where `Air_System_Pressure(bar)` is null or `Coolant_Pressure(bar)` = ' ';
select count(*) as ct from machinedowntime where Coolant_Temperature is null or Coolant_Temperature = ' ';
select count(*) as hot from machinedowntime where `Hydraulic_Oil_Temperature(Â°C)` is null or `Hydraulic_Oil_Temperature(Â°C)`= ' ';
select count(*) as sbt from machinedowntime where `Spindle_Bearing_Temperature(Â°C)` is null or `Spindle_Bearing_Temperature(Â°C)`= ' ';
select count(*) as sv from machinedowntime where `Spindle_Vibration(Âµm)` is null or `Spindle_Vibration(Âµm)`= ' ';
select count(*) as tv from machinedowntime where `Tool_Vibration(Âµm)` is null or `Tool_Vibration(Âµm)`= ' ';
select count(*) as ss from machinedowntime where `Spindle_Speed(RPM)` is null or `Spindle_Speed(RPM)`= ' ';
select count(*) as v from machinedowntime where `Voltage(volts)` is null or `Voltage(volts)`= ' ';
select count(*) as t from machinedowntime where `Torque(Nm)` is null or `Torque(Nm)`= ' ';
select count(*) as c from machinedowntime where `Cutting(kN)` is null or `Cutting(kN)`= ' ';

-- update date format

update machinedowntime set date = str_to_date(Date, '%m/%d/%Y');
select * from machinedowntime;

-- column reduction
 alter table
 machinedowntime
 drop column Machine_ID, drop column `Assembly_Line_No`, drop column `Date`;
 
 -- univariate, display count, min, max, avg, std
 select count(`Hydraulic_Pressure(bar)`),
 min(`Hydraulic_Pressure(bar)`),
 max(`Hydraulic_Pressure(bar)`),
 avg(`Hydraulic_Pressure(bar)`),
 std(`Hydraulic_Pressure(bar)`)
 from machinedowntime;
 
 select count(`Coolant_Pressure(bar)`),
 min(`Coolant_Pressure(bar)`),
 max(`Coolant_Pressure(bar)`),
 avg(`Coolant_Pressure(bar)`),
 std(`Coolant_Pressure(bar)`)
 from machinedowntime;
 
 select min(`Air_System_Pressure(bar)`),
 max(`Air_System_Pressure(bar)`),
 avg(`Air_System_Pressure(bar)`),
 std(`Air_System_Pressure(bar)`)
 from machinedowntime;
 
 select min(Coolant_Temperature),
 max(Coolant_Temperature),
 avg(Coolant_Temperature),
 std(Coolant_Temperature)
 from machinedowntime;
 
 select min(`Hydraulic_Oil_Temperature(Â°C)`),
 max(`Hydraulic_Oil_Temperature(Â°C)`),
 avg(`Hydraulic_Oil_Temperature(Â°C)`),
 std(`Hydraulic_Oil_Temperature(Â°C)`)
 from machinedowntime;
 
 select min(`Spindle_Bearing_Temperature(Â°C)`),
 max(`Spindle_Bearing_Temperature(Â°C)`),
 avg(`Spindle_Bearing_Temperature(Â°C)`),
 std(`Spindle_Bearing_Temperature(Â°C)`)
 from machinedowntime;
 
 select min(`Spindle_Vibration(Âµm)`),
 max(`Spindle_Vibration(Âµm)`),
 avg(`Spindle_Vibration(Âµm)`),
 std(`Spindle_Vibration(Âµm)`)
 from machinedowntime;
 
 select min(`Tool_Vibration(Âµm)`),
 max(`Tool_Vibration(Âµm)`),
 avg(`Tool_Vibration(Âµm)`),
 std(`Tool_Vibration(Âµm)`)
 from machinedowntime;
 
 select min(`Spindle_Speed(RPM)`),
 max(`Spindle_Speed(RPM)`),
 avg(`Spindle_Speed(RPM)`),
 std(`Spindle_Speed(RPM)`)
 from machinedowntime;
 
 select min(`Voltage(volts)`),
 max(`Voltage(volts)`),
 avg(`Voltage(volts)`),
 std(`Voltage(volts)`)
 from machinedowntime;
 
 select min(`Torque(Nm)`),
 max(`Torque(Nm)`),
 avg(`Torque(Nm)`),
 std(`Torque(Nm)`)
 from machinedowntime;
 
 select min(`Cutting(kN)`),
 max(`Cutting(kN)`),
 avg(`Cutting(kN)`),
 std(`Cutting(kN)`)
 from machinedowntime;
 
-- impute missing values in columns with avg

select `Hydraulic_Pressure(bar)`, 
coalesce(`Hydraulic_Pressure(bar)`, avg(`Hydraulic_Pressure(bar)`) over ()) as Hydraulic_Pressure
from machinedowntime;
update machinedowntime
set `Hydraulic_Pressure(bar)` = 101.40908377755412
where `Hydraulic_Pressure(bar)` is null;

select `Coolant_Pressure(bar)`, 
coalesce(`Coolant_Pressure(bar)`, avg(`Coolant_Pressure(bar)`) over ()) as Coolant_Pressure
from machinedowntime;
update machinedowntime
set `Coolant_Pressure(bar)` = 4.94705847351793
where `Coolant_Pressure(bar)` is null;

select `Air_System_Pressure(bar)`, 
coalesce(`Air_System_Pressure(bar)`, avg(`Air_System_Pressure(bar)`) over ()) as Air_System_Pressure
from machinedowntime;
update machinedowntime
set `Air_System_Pressure(bar)` = 6.4992745962251375
where `Air_System_Pressure(bar)` is null;

select `Coolant_Temperature`, 
coalesce(`Coolant_Temperature`, avg(`Coolant_Temperature`) over ()) as CoolantTemperature
from machinedowntime;
update machinedowntime
set `Coolant_Temperature` = 18.559887459807154
where `Coolant_Temperature` is null;

select `Hydraulic_Oil_Temperature(Â°C)`, 
coalesce(`Hydraulic_Oil_Temperature(Â°C)`, avg(`Hydraulic_Oil_Temperature(Â°C)`) over ()) as Hydraulic_Oil_Temperature
from machinedowntime;
update machinedowntime
set `Hydraulic_Oil_Temperature(Â°C)` = 47.6183172302738
where `Hydraulic_Oil_Temperature(Â°C)` is null;

select `Spindle_Bearing_Temperature(Â°C)`, 
coalesce(`Spindle_Bearing_Temperature(Â°C)`, avg(`Spindle_Bearing_Temperature(Â°C)`) over ()) as Spindle_Bearing_Temperature
from machinedowntime;
update machinedowntime
set `Spindle_Bearing_Temperature(Â°C)` = 35.06369835539507
where `Spindle_Bearing_Temperature(Â°C)` is null;

select `Spindle_Vibration(Âµm)`, 
coalesce(`Spindle_Vibration(Âµm)`, avg(`Spindle_Vibration(Âµm)`) over ()) as Spindle_Vibration
from machinedowntime;
update machinedowntime
set `Spindle_Vibration(Âµm)` = 1.0093342707914827
where `Spindle_Vibration(Âµm)` is null;

select `Tool_Vibration(Âµm)`, 
coalesce(`Tool_Vibration(Âµm)`, avg(`Tool_Vibration(Âµm)`) over ()) as Tool_Vibration
from machinedowntime;
update machinedowntime
set `Tool_Vibration(Âµm)` = 25.41197509039763
where `Tool_Vibration(Âµm)` is null;

select `Spindle_Speed(RPM)`, 
coalesce(`Spindle_Speed(RPM)`, avg(`Spindle_Speed(RPM)`) over ()) as Spindle_Speed
from machinedowntime;
update machinedowntime
set `Spindle_Speed(RPM)` = 20274.7923
where `Spindle_Speed(RPM)` is null;

select `Voltage(volts)`, 
coalesce(`Voltage(volts)`, avg(`Voltage(volts)`) over ()) as Voltage
from machinedowntime;
update machinedowntime
set `Voltage(volts)` = 348.9968
where `Voltage(volts)` is null;

select `Torque(Nm)`, 
coalesce(`Torque(Nm)`, avg(`Torque(Nm)`) over ()) as Torque
from machinedowntime;
update machinedowntime
set `Torque(Nm)` = 25.23496773013697
where `Torque(Nm)` is null;

select `Cutting(kN)`, 
coalesce(`Cutting(kN)`, avg(`Cutting(kN)`) over ()) as Cutting
from machinedowntime;
update machinedowntime
set `Cutting(kN)` = 2.7825511432009598
where `Cutting(kN)` is null;

select * from machinedowntime;

-- check outliers using avg & std: abs(column value - avg(column)) > 2 * std(columm)
select count(`Hydraulic_Pressure(bar)`) from machinedowntime where abs(`Hydraulic_Pressure(bar)` - 101.40908377755412) > 2*30.31731475452119;
select count(`Coolant_Pressure(bar)`) from machinedowntime where abs(`Coolant_Pressure(bar)` - 4.94705847351793) > 2*0.9971561616891136;
select count(`Air_System_Pressure(bar)`) from machinedowntime where abs(`Air_System_Pressure(bar)` - 6.4992745962251375) > 2*0.4071973906314401;
select count(`Coolant_Temperature`) from machinedowntime where abs(`Coolant_Temperature` - 18.559887459807154) > 2*8.552760332903864;
select count(`Hydraulic_Oil_Temperature(Â°C)`) from machinedowntime where abs(`Hydraulic_Oil_Temperature(Â°C)` - 47.6183172302738) > 2*3.767915688237261;
select count(`Spindle_Bearing_Temperature(Â°C)`) from machinedowntime where abs(`Spindle_Bearing_Temperature(Â°C)` - 35.06369835539507) > 2*3.764068127078481;
select count(`Spindle_Vibration(Âµm)`) from machinedowntime where abs(`Spindle_Vibration(Âµm)` - 1.0093342707914827) > 2*0.34282916450212764;
select count(`Tool_Vibration(Âµm)`) from machinedowntime where abs(`Tool_Vibration(Âµm)` - 25.41197509039763) > 2*6.435848571420316;
select count(`Spindle_Speed(RPM)`) from machinedowntime where abs(`Spindle_Speed(RPM)` - 20274.7923) > 2*3851.887592574172;
select count(`Voltage(volts)`) from machinedowntime where abs(`Voltage(volts)` - 348.9968) > 2*45.36692593575887;
select count(`Torque(Nm)`) from machinedowntime where abs(`Torque(Nm)` - 25.23496773013697) > 2*6.137325289259717;
select count(`Cutting(kN)`) from machinedowntime where abs(`Cutting(kN)` - 2.7825511432009598) > 2*0.6165645587332578;

-- normalization of each feature column
select * from machinedowntime;
select `Hydraulic_Pressure(bar)`, (`Hydraulic_Pressure(bar)` - min(`Hydraulic_Pressure(bar)`) over ()) * 1.0/ (max(`Hydraulic_Pressure(bar)`) over () - min(`Hydraulic_Pressure(bar)`) over ()) as scaled_hp
from machinedowntime;

select `Coolant_Pressure(bar)`, (`Coolant_Pressure(bar)` - min(`Coolant_Pressure(bar)`) over ()) * 1.0/ (max(`Coolant_Pressure(bar)`) over () - min(`Coolant_Pressure(bar)`) over ()) as scaled_cp
from machinedowntime;

select `Air_System_Pressure(bar)`, (`Air_System_Pressure(bar)` - min(`Air_System_Pressure(bar)`) over ()) * 1.0/ (max(`Air_System_Pressure(bar)`) over () - min(`Air_System_Pressure(bar)`) over ()) as scaled_asp
from machinedowntime;

select `Coolant_Temperature`, (`Coolant_Temperature` - min(`Coolant_Temperature`) over ()) * 1.0/ (max(`Coolant_Temperature`) over () - min(`Coolant_Temperature`) over ()) as scaled_ct
from machinedowntime;

select `Hydraulic_Oil_Temperature(Â°C)`, (`Hydraulic_Oil_Temperature(Â°C)` - min(`Hydraulic_Oil_Temperature(Â°C)`) over ()) * 1.0/ (max(`Hydraulic_Oil_Temperature(Â°C)`) over () - min(`Hydraulic_Oil_Temperature(Â°C)`) over ()) as scaled_hot
from machinedowntime;

select `Spindle_Bearing_Temperature(Â°C)`, (`Spindle_Bearing_Temperature(Â°C)` - min(`Spindle_Bearing_Temperature(Â°C)`) over ()) * 1.0/ (max(`Spindle_Bearing_Temperature(Â°C)`) over () - min(`Spindle_Bearing_Temperature(Â°C)`) over ()) as scaled_sbt
from machinedowntime;

select `Spindle_Vibration(Âµm)`, (`Spindle_Vibration(Âµm)` - min(`Spindle_Vibration(Âµm)`) over ()) * 1.0/ (max(`Spindle_Vibration(Âµm)`) over () - min(`Spindle_Vibration(Âµm)`) over ()) as scaled_sv
from machinedowntime;

select `Tool_Vibration(Âµm)`, (`Tool_Vibration(Âµm)` - min(`Tool_Vibration(Âµm)`) over ()) * 1.0/ (max(`Tool_Vibration(Âµm)`) over () - min(`Tool_Vibration(Âµm)`) over ()) as scaled_tv
from machinedowntime;

select `Spindle_Speed(RPM)`, (`Spindle_Speed(RPM)` - min(`Spindle_Speed(RPM)`) over ()) * 1.0/ (max(`Spindle_Speed(RPM)`) over () - min(`Spindle_Speed(RPM)`) over ()) as scaled_ss
from machinedowntime;

select `Voltage(volts)`, (`Voltage(volts)` - min(`Voltage(volts)`) over ()) * 1.0/ (max(`Voltage(volts)`) over () - min(`Voltage(volts)`) over ()) as scaled_v
from machinedowntime;

select `Torque(Nm)`, (`Torque(Nm)` - min(`Torque(Nm)`) over ()) * 1.0/ (max(`Torque(Nm)`) over () - min(`Torque(Nm)`) over ()) as scaled_t
from machinedowntime;

select `Cutting(kN)`, (`Cutting(kN)` - min(`Cutting(kN)`) over ()) * 1.0/ (max(`Cutting(kN)`) over () - min(`Cutting(kN)`) over ()) as scaled_c
from machinedowntime;



