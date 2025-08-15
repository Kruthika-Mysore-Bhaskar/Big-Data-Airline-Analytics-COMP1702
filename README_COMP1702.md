# Big Data Airline Analytics (COMP1702)

**Author:** Kruthika Mysore Bhaskar  
**Report:** `001354599_COMP1702.pdf`

This portfolio project demonstrates **end‑to‑end big data skills** using the classic airline scenario:
- Standing up **Hadoop** services (HDFS, YARN)  
- Designing a **Hive data warehouse** for Passengers, Flights, and Bookings  
- Writing **analytical SQL** in Hive (joins, aggregations, filters, top‑N)  
- Explaining a **MapReduce** solution (count courses per year)  
- Proposing a secure, scalable **cloud architecture** for precision‑agriculture data

> Built around a university assignment; scripts here are cleaned and recruiter‑friendly for public viewing. The PDF provides full screenshots and details.
> *(Use a local Hadoop VM if you want to reproduce the steps.)*

---

## 🧭 What’s inside

- `001354599_COMP1702.pdf` — full report with screenshots (HDFS, Hive tables, queries, results).
- `hive/airline_warehouse.sql` — DDL + example analytical queries to reproduce key results.
- `mapreduce/README.md` — mapper/combiner/reducer pseudocode with rationale.
- `LICENSE`, `.gitignore`, `RELEASE_NOTES.md`.

## ▶️ Reproduce locally (Hadoop VM)

1. Start Hadoop services
   ```bash
   start-dfs.sh
   start-yarn.sh
   ```

2. Put CSVs to HDFS (example paths; adjust for your VM)
   ```bash
   hdfs dfs -mkdir -p /data/airline
   hdfs dfs -put Passengers.csv /data/airline/
   hdfs dfs -put Flights.csv /data/airline/
   hdfs dfs -put Bookings.csv /data/airline/
   ```

3. Run Hive script
   ```bash
   hive -f hive/airline_warehouse.sql
   ```

## 🏷️ Suggested GitHub topics
`big-data`, `hadoop`, `hive`, `mapreduce`, `data-engineering`, `distributed-systems`, `cloud-computing`, `data-warehouse`, `etl`, `sql`

---

### 📣 Portfolio note
This shows infrastructure + query design. Pair it with your ChrisCo viz repo for breadth.

### 📜 License
MIT — see `LICENSE`.
