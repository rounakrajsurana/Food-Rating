----------------------------------- 7. -----------------------------------
DROP VIEW stocks_i_like;
DROP TABLE my_stocks CASCADE;
DROP TABLE stock_prices CASCADE;
DROP TABLE newly_acquired_stocks CASCADE;

create table my_stocks (
symbol varchar(20) not null,
n_shares integer not null,
date_acquired date not null
);

COPY my_stocks FROM '/home/st120546/ps2/ps2_myFavStock_imp.txt' (FORMAT TEXT, DELIMITER E'\x9');
select * from my_stocks;
----------------------------------- 8.-----------------------------------
create table stock_prices (
symbol varchar(20) not null,
quote_date date not null,
price integer not null
);
INSERT INTO stock_prices
select symbol, NOW() as quote_date, 31.415 as price from my_stocks;
select * from stock_prices;

create table newly_acquired_stocks (
symbol varchar(20) not null,
n_shares integer not null,
date_acquired date not null
);
INSERT INTO newly_acquired_stocks
select symbol, n_shares, date_acquired from my_stocks WHERE symbol NOT LIKE 'A%';
select * from newly_acquired_stocks;
----------------------------------- 9.-----------------------------------
select * from my_stocks NATURAL JOIN stock_prices;

----------------------------------- 10. -----------------------------------
INSERT INTO my_stocks values ('SDIVX', 1000, '11/09/2018');
SELECT * FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices;

----------------------------------- 11.-----------------------------------
CREATE OR REPLACE FUNCTION trade_cal(in_str VARCHAR)
RETURNS NUMERIC
AS $$
DECLARE
out_str NUMERIC DEFAULT 0;
stk_cal NUMERIC DEFAULT 0;
BEGIN
out_str :=0;
FOR i IN 1..LENGTH(in_str) LOOP
stk_cal := ASCII(SUBSTR(in_str,i,1));
out_str := out_str + stk_cal;
END LOOP;
RETURN out_str;
END;
$$ LANGUAGE plpgsql;

select trade_cal('IBM');

UPDATE stock_prices SET price = trade_cal(symbol);
SELECT * FROM stock_prices;

------------------------
CREATE OR REPLACE Function portfolio_value ()
RETURNS NUMERIC
AS $$
DECLARE
c1 CURSOR FOR SELECT * FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices;
total_val NUMERIC DEFAULT 0;
stk_val NUMERIC DEFAULT 0;
stk RECORD;
BEGIN
OPEN c1;
LOOP
FETCH c1 INTO stk;
IF stk IS NOT NULL THEN
IF stk.price>0 THEN
stk_val := (stk.n_shares * stk.price);
total_val := total_val + stk_val;
ELSE
stk_val := 0;
END IF;
RAISE NOTICE 'Value of: % = %', stk.symbol,stk_val;
END IF;
EXIT WHEN NOT FOUND;
END LOOP;
CLOSE c1;
RETURN total_val;
END;
$$ LANGUAGE plpgsql;

select portfolio_value ();

----------------------------------- 12.-----------------------------------
SELECT AVG(price) FROM stock_prices ;
SELECT symbol, n_shares, NOW() from my_stocks NATURAL JOIN stock_prices, (SELECT AVG(price) as avgp FROM stock_prices) as avg_price WHERE stock_prices.price > avg_price.avgp;

INSERT INTO my_stocks
select symbol, n_shares, NOW() from my_stocks NATURAL JOIN stock_prices, (SELECT AVG(price) as avgp FROM stock_prices) as avg_price WHERE stock_prices.price > avg_price.avgp;

select * FROM my_stocks ;
SELECT * FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices;

SELECT my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) last_acquired from my_stocks group by my_stocks.symbol;

SELECT my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) last_acquired, stock_prices.price, (SUM(n_shares)*stock_prices.price) total_value_held FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices group by my_stocks.symbol, stock_prices.price having COUNT(symbol) > 1;

----------------------------------- 13. -----------------------------------
CREATE VIEW stocks_i_like AS
SELECT my_stocks.symbol, SUM(n_shares) total_shares_held, MAX(date_acquired) last_acquired, stock_prices.price, (SUM(n_shares)*stock_prices.price) total_value_held FROM my_stocks NATURAL LEFT OUTER JOIN stock_prices group by my_stocks.symbol, stock_prices.price having COUNT(symbol) > 1;

select * from stocks_i_like;
--------------------------------------------------------------------------------
