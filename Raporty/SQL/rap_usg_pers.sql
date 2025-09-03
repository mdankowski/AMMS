WITH combined_results AS (
  SELECT
    CASE
      WHEN jos.nazwa IS NOT NULL THEN 'SPZLO w Wieliczce'
      WHEN ins.nazwa_skrot IS NOT NULL THEN ins.nazwa_skrot
      ELSE 'Pacjent płatne'
    END AS "Instytucja zlecająca",
    CASE
      WHEN jos.nazwa IS NOT NULL THEN jos.nazwa
      ELSE NULL
    END AS "Jednostka zlecająca (Poradnia)",
    count(*) as "Ogółem badań",
    count(case when el.KOD_ELECZ in ('CH304') then 1 else null end) as "88.713",
    count(case when el.KOD_ELECZ in ('CH305') then 1 else null end) as "88.714",
    count(case when el.KOD_ELECZ in ('CH306') then 1 else null end) as "88.717",
    count(case when el.KOD_ELECZ in ('CH309') then 1 else null end) as "88.732",
    count(case when el.KOD_ELECZ in ('CH310') then 1 else null end) as "88.752",
    count(case when el.KOD_ELECZ in ('CH311') then 1 else null end) as "88.761",
    count(case when el.KOD_ELECZ in ('CH312') then 1 else null end) as "88.771",
    count(case when el.KOD_ELECZ in ('CH313') then 1 else null end) as "88.776",
    count(case when el.KOD_ELECZ in ('CH314') then 1 else null end) as "88.777",
    count(case when el.KOD_ELECZ in ('CH315') then 1 else null end) as "88.789",
    count(case when el.KOD_ELECZ in ('CH316') then 1 else null end) as "88.792",
    count(case when el.KOD_ELECZ in ('CH317') then 1 else null end) as "88.794",
    count(case when el.KOD_ELECZ in ('CH318') then 1 else null end) as "88.795",
    count(case when el.KOD_ELECZ in ('CH319') then 1 else null end) as "88.797",
    count(case when el.KOD_ELECZ in ('CH320') then 1 else null end) as "88.798",
    count(case when el.KOD_ELECZ in ('CH321') then 1 else null end) as "88.799",
    count(case when el.KOD_ELECZ in ('CH322') then 1 else null end) as "88.732-2",
    count(case when el.KOD_ELECZ in ('CH323') then 1 else null end) as "88.79",
    count(case when el.KOD_ELECZ in ('USG-88.715') then 1 else null end) as "88.715",
    count(case when el.KOD_ELECZ in ('USG-88.734') then 1 else null end) as "88.734",
    count(case when el.KOD_ELECZ in ('USG-88.769') then 1 else null end) as "88.769",
    count(case when el.KOD_ELECZ in ('USG88.777-1') then 1 else null end) as "88.777-1",
    count(case when el.KOD_ELECZ in ('USG88.777-2') then 1 else null end) as "88.777-2",
    count(case when el.KOD_ELECZ in ('USG-88.790') then 1 else null end) as "88.790",
    count(case when el.KOD_ELECZ in ('USG88.796') then 1 else null end) as "88.796"
  FROM
    wyk_elecz we
    JOIN ELEM_LECZ el ON el.kod_elecz = we.ID_ELECZ
    JOIN DBAP_UZYTKOWNICY u ON u.kod = we.uzy_autor
    LEFT JOIN zlecenie zl ON zl.id_zlec = we.id_zlec
    LEFT JOIN skier_sklad ss ON ss.id_zlec = zl.id_zlec
    LEFT JOIN skierowanie sk ON sk.id_skier = ss.id_skier
    LEFT JOIN instytucja ins ON ins.id_inst = sk.id_inst_kier
    LEFT JOIN jos ON jos.idk_jos = sk.idk_jos_kier
  WHERE
    we.idk_jos_wyk = '1USGD1'
    AND we.dt_autor BETWEEN :PARAM(data_od; D) AND :PARAM(data_do; D) + 0.99999
    AND u.kod = :PARAM(user2; C; ; SZPM&UZYTK)
  GROUP BY
    CASE
      WHEN jos.nazwa IS NOT NULL THEN 'SPZLO w Wieliczce'
      WHEN ins.nazwa_skrot IS NOT NULL THEN ins.nazwa_skrot
      ELSE 'Pacjent płatne'
    END,
    CASE
      WHEN jos.nazwa IS NOT NULL THEN jos.nazwa
      ELSE NULL
    END

  UNION ALL

  SELECT
    'SPZLO w Wieliczce' AS "Instytucja zlecająca",
    '--- SUMA SPZLO ---' AS "Jednostka zlecająca (Poradnia)",
    count(*) as "Ogółem badań",
    count(case when el.KOD_ELECZ in ('CH304') then 1 else null end) as "88.713",
    count(case when el.KOD_ELECZ in ('CH305') then 1 else null end) as "88.714",
    count(case when el.KOD_ELECZ in ('CH306') then 1 else null end) as "88.717",
    count(case when el.KOD_ELECZ in ('CH309') then 1 else null end) as "88.732",
    count(case when el.KOD_ELECZ in ('CH310') then 1 else null end) as "88.752",
    count(case when el.KOD_ELECZ in ('CH311') then 1 else null end) as "88.761",
    count(case when el.KOD_ELECZ in ('CH312') then 1 else null end) as "88.771",
    count(case when el.KOD_ELECZ in ('CH313') then 1 else null end) as "88.776",
    count(case when el.KOD_ELECZ in ('CH314') then 1 else null end) as "88.777",
    count(case when el.KOD_ELECZ in ('CH315') then 1 else null end) as "88.789",
    count(case when el.KOD_ELECZ in ('CH316') then 1 else null end) as "88.792",
    count(case when el.KOD_ELECZ in ('CH317') then 1 else null end) as "88.794",
    count(case when el.KOD_ELECZ in ('CH318') then 1 else null end) as "88.795",
    count(case when el.KOD_ELECZ in ('CH319') then 1 else null end) as "88.797",
    count(case when el.KOD_ELECZ in ('CH320') then 1 else null end) as "88.798",
    count(case when el.KOD_ELECZ in ('CH321') then 1 else null end) as "88.799",
    count(case when el.KOD_ELECZ in ('CH322') then 1 else null end) as "88.732-2",
    count(case when el.KOD_ELECZ in ('CH323') then 1 else null end) as "88.79",
    count(case when el.KOD_ELECZ in ('USG-88.715') then 1 else null end) as "88.715",
    count(case when el.KOD_ELECZ in ('USG-88.734') then 1 else null end) as "88.734",
    count(case when el.KOD_ELECZ in ('USG-88.769') then 1 else null end) as "88.769",
    count(case when el.KOD_ELECZ in ('USG88.777-1') then 1 else null end) as "88.777-1",
    count(case when el.KOD_ELECZ in ('USG88.777-2') then 1 else null end) as "88.777-2",
    count(case when el.KOD_ELECZ in ('USG-88.790') then 1 else null end) as "88.790",
    count(case when el.KOD_ELECZ in ('USG88.796') then 1 else null end) as "88.796"
  FROM
    wyk_elecz we
    JOIN ELEM_LECZ el ON el.kod_elecz = we.ID_ELECZ
    JOIN DBAP_UZYTKOWNICY u ON u.kod = we.uzy_autor
    LEFT JOIN zlecenie zl ON zl.id_zlec = we.id_zlec
    LEFT JOIN skier_sklad ss ON ss.id_zlec = zl.id_zlec
    LEFT JOIN skierowanie sk ON sk.id_skier = ss.id_skier
    LEFT JOIN instytucja ins ON ins.id_inst = sk.id_inst_kier
    LEFT JOIN jos ON jos.idk_jos = sk.idk_jos_kier
  WHERE
    we.idk_jos_wyk = '1USGD1'
    AND we.dt_autor BETWEEN :PARAM(data_od; D) AND :PARAM(data_do; D) + 0.99999
    AND jos.nazwa IS NOT NULL
    AND u.kod = :PARAM(user2; C; ; SZPM&UZYTK)

  UNION ALL

  SELECT
    '--- SUMA KONTRAHENCI ---' AS "Instytucja zlecająca",
    NULL AS "Jednostka zlecająca (Poradnia)",
    count(*) as "Ogółem badań",
    count(case when el.KOD_ELECZ in ('CH304') then 1 else null end) as "88.713",
    count(case when el.KOD_ELECZ in ('CH305') then 1 else null end) as "88.714",
    count(case when el.KOD_ELECZ in ('CH306') then 1 else null end) as "88.717",
    count(case when el.KOD_ELECZ in ('CH309') then 1 else null end) as "88.732",
    count(case when el.KOD_ELECZ in ('CH310') then 1 else null end) as "88.752",
    count(case when el.KOD_ELECZ in ('CH311') then 1 else null end) as "88.761",
    count(case when el.KOD_ELECZ in ('CH312') then 1 else null end) as "88.771",
    count(case when el.KOD_ELECZ in ('CH313') then 1 else null end) as "88.776",
    count(case when el.KOD_ELECZ in ('CH314') then 1 else null end) as "88.777",
    count(case when el.KOD_ELECZ in ('CH315') then 1 else null end) as "88.789",
    count(case when el.KOD_ELECZ in ('CH316') then 1 else null end) as "88.792",
    count(case when el.KOD_ELECZ in ('CH317') then 1 else null end) as "88.794",
    count(case when el.KOD_ELECZ in ('CH318') then 1 else null end) as "88.795",
    count(case when el.KOD_ELECZ in ('CH319') then 1 else null end) as "88.797",
    count(case when el.KOD_ELECZ in ('CH320') then 1 else null end) as "88.798",
    count(case when el.KOD_ELECZ in ('CH321') then 1 else null end) as "88.799",
    count(case when el.KOD_ELECZ in ('CH322') then 1 else null end) as "88.732-2",
    count(case when el.KOD_ELECZ in ('CH323') then 1 else null end) as "88.79",
    count(case when el.KOD_ELECZ in ('USG-88.715') then 1 else null end) as "88.715",
    count(case when el.KOD_ELECZ in ('USG-88.734') then 1 else null end) as "88.734",
    count(case when el.KOD_ELECZ in ('USG-88.769') then 1 else null end) as "88.769",
    count(case when el.KOD_ELECZ in ('USG88.777-1') then 1 else null end) as "88.777-1",
    count(case when el.KOD_ELECZ in ('USG88.777-2') then 1 else null end) as "88.777-2",
    count(case when el.KOD_ELECZ in ('USG-88.790') then 1 else null end) as "88.790",
    count(case when el.KOD_ELECZ in ('USG88.796') then 1 else null end) as "88.796"
  FROM
    wyk_elecz we
    JOIN ELEM_LECZ el ON el.kod_elecz = we.ID_ELECZ
    JOIN DBAP_UZYTKOWNICY u ON u.kod = we.uzy_autor
    LEFT JOIN zlecenie zl ON zl.id_zlec = we.id_zlec
    LEFT JOIN skier_sklad ss ON ss.id_zlec = zl.id_zlec
    LEFT JOIN skierowanie sk ON sk.id_skier = ss.id_skier
    LEFT JOIN instytucja ins ON ins.id_inst = sk.id_inst_kier
    LEFT JOIN jos ON jos.idk_jos = sk.idk_jos_kier
  WHERE
    we.idk_jos_wyk = '1USGD1'
    AND we.dt_autor BETWEEN :PARAM(data_od; D) AND :PARAM(data_do; D) + 0.99999
    AND ins.nazwa_skrot IS NOT NULL
    AND u.kod = :PARAM(user2; C; ; SZPM&UZYTK)
)
SELECT *
FROM combined_results
ORDER BY
  CASE 
    WHEN "Instytucja zlecająca" = 'SPZLO w Wieliczce' THEN 1
    WHEN "Instytucja zlecająca" = '--- SUMA KONTRAHENCI ---' THEN 3
    WHEN "Instytucja zlecająca" = 'Pacjent płatne' THEN 4
    ELSE 2
  END,
  "Instytucja zlecająca",
  CASE 
    WHEN "Jednostka zlecająca (Poradnia)" = '--- SUMA SPZLO ---' THEN 2 
    ELSE 1 
  END,
  "Jednostka zlecająca (Poradnia)"
