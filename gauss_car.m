function y=gauss_car(paras,x)

b = paras(1);
a = paras(2);
po = paras(3);
tw = paras(4);

y=b+a.*exp(-(x-po).^2 / (2*tw^2));