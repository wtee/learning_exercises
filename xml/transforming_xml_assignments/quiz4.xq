<report>
  <title>Report: Time to acceptance</title>
  {
    for $item in fn:doc("pubmed_sample.xml")/ArticleSet/Article
      let $journal := $item/Journal/JournalTitle/text()
      let $title := $item/ArticleTitle/text()
      let $year_r := $item/History/PubDate[@PubStatus="received"]/Year/text()
      let $month_r := $item/History/PubDate[@PubStatus="received"]/Month/text()
      let $day_r := $item/History/PubDate[@PubStatus="received"]/Day/text()
      let $year_a := $item/History/PubDate[@PubStatus="accepted"]/Year/text()
      let $month_a := $item/History/PubDate[@PubStatus="accepted"]/Month/text()
      let $day_a := $item/History/PubDate[@PubStatus="accepted"]/Day/text()
      let $date_r := fn:string-join(($year_r, $month_r, $day_r), '-') 
      let $date_a := fn:string-join(($year_a, $month_a, $day_a), '-')
      order by $year_r, $journal, $title
      return
      <article>
        <journal>{$journal}</journal>
        <title>{$title}</title>
        <received>{$date_r}</received>
        <accepted>{$date_r}</accepted>
        <time_taken>Time to acceptance: {fn:days-from-duration((xs:date($date_a) - xs:date($date_r)))} days.</time_taken>
      </article>
  }</report>
