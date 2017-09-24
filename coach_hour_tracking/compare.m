%Week number
week=2;
clear total;
%In the csv file, only rows 1-8 are relevant.
rng=1:8;
%All of Coach's worked hours this week.  The total hours worked this 
% week number are captured in the last element 'end'.
adam_exp=AdamAugustyniak(rng,2*week-1);
adam_act=AdamAugustyniak(rng,2*week);
adam=adam_exp(end)-adam_act(end); %error between expected hours and actual hours

anna_exp=AnnaWheatley(rng, 2*week-1);
anna_act=AnnaWheatley(rng, 2*week);
anna=anna_exp(end)-anna_act(end);

brittany_exp=BrittanyStagman(rng, 2*week-1);
brittany_act=BrittanyStagman(rng, 2*week);
brittany=brittany_exp(end)-brittany_act(end);

daanish_exp=DannishTyrewala(rng, 2*week-1);
daanish_act=DannishTyrewala(rng, 2*week);
daanish=daanish_exp(end)-daanish_act(end);

david_exp=DavidAdamovicz(rng, 2*week-1);
david_act=DavidAdamovicz(rng, 2*week);
david=david_exp(end)-david_act(end);

liz_exp=ElizabethBergh(rng, 2*week-1);
liz_act=ElizabethBergh(rng, 2*week);
liz=liz_exp(end)-liz_act(end);

erica_exp=EricaJacobson(rng, 2*week-1);
erica_act=EricaJacobson(rng, 2*week);
erica=erica_exp(end)-erica_act(end);

jacob_exp=JacobProchnow(rng, 2*week-1);
jacob_act=JacobProchnow(rng, 2*week);
jacob=jacob_exp(end)-jacob_act(end);

jesse_exp=JesseLassila(rng, 2*week-1);
jesse_act=JesseLassila(rng, 2*week);
jesse=jesse_exp(end)-jesse_act(end);

john_exp=JohnStough(rng, 2*week-1);
john_act=JohnStough(rng, 2*week);
john=john_exp(end)-john_act(end);

julia_exp=JuliaSmit(rng, 2*week-1);
julia_act=JuliaSmit(rng, 2*week);
julia=julia_exp(end)-julia_act(end);

mar_exp=MarcelloGuadagno(rng, 2*week-1);
mar_act=MarcelloGuadagno(rng, 2*week);
marcello=mar_exp(end)-mar_act(end);

max_exp=MaxEllingson(rng, 2*week-1);
max_act=MaxEllingson(rng, 2*week);
max=max_exp(end)-max_act(end);

paras_exp=ParasRavindraGhumare(rng, 2*week-1);
paras_act=ParasRavindraGhumare(rng, 2*week);
paras=paras_exp(end)-paras_act(end);

riley_exp=RileyStroven(rng, 2*week-1);
riley_act=RileyStroven(rng, 2*week);
riley=riley_exp(end)-riley_act(end);

robbie_exp=RobbieTian(rng, 2*week-1);
robbie_act=RobbieTian(rng, 2*week);
robbie=robbie_exp(end)-robbie_act(end);

robert_exp=RobertMikulaMalstrom(rng, 2*week-1);
robert_act=RobertMikulaMalstrom(rng, 2*week);
robert=robert_exp(end)-robert_act(end);

sid_exp=SiddhantDange(rng, 2*week-1);
sid_act=SiddhantDange(rng, 2*week);
siddhant=sid_exp(end)-sid_act(end);

total=adam_act(end) + anna_act(end) + brittany_act(end) + daanish_act(end) + david_act(end) + liz_act(end) + erica_act(end) + jacob_act(end) + ...
    jesse_act(end) + john_act(end) + julia_act(end) + mar_act(end) + max_act(end) + paras_act(end) + riley_act(end) + robbie_act(end) + ...
   robert_act(end) + sid_act(end) ;

