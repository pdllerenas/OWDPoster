#import "@preview/peace-of-posters:0.6.0" as pop
#import "@preview/droplet:0.3.1": dropcap

#set page("a0", margin: 1cm)
#pop.set-poster-layout(pop.layout-a0)
#pop.set-theme(pop.uni-fr)
#set text(size: pop.layout-a0.at("body-size"))
#let box-spacing = 1.2em
#set columns(gutter: box-spacing)
#set block(spacing: box-spacing)
#pop.update-poster-layout(spacing: box-spacing)

#set par(justify: true)

#let img-placeholder(width: 100%, height: 100pt, label: "Image") = {
  rect(
    width: width,
    height: height,
    fill: rgb("e0e0e0"),
    stroke: 0.5pt + rgb("b0b0b0"),
    radius: 2pt,
    align(center + horizon, text(fill: rgb("707070"), font: "Liberation Sans")[#label]),
  )
}


#pop.title-box(
  "Non-Intrusive Available Bandwidth Estimation using One-Way Delay Measurements",
  authors: "Pedro D. Llerenas",
  institutes: "Centro de Investigación en Matemáticas",
  //keywords: "Available Bandwidth, IP Networks",
  logo: none,
)

#columns(2, [
  #pop.column-box(heading: "Introduction")[
    #dropcap(height: 2, gap: 5pt)[Estimating available bandwidth (available-bw) has become a crucial task for
      application owners, network operators and end users. Application managers
      primarily need bandwidth estimation in order to utilize the available
      resources at maximum efficiency and provide the best Quality of Service
      (QoS) to the client. Network operators need this same estimate to plan
      capacity upgrades for their infrastructure. End users need to know their
      available-bw to verify that their Internet Service Provider (ISP) is
      fulfilling their contract of promised bandwidth.]

    Generally, the available-bw is defined as the maximum rate that a path can
    provide to a flow, without reducing the rate of the cross-traffic in the
    path @jain2003. In the last 30 years, many active estimation techniques and
    software tools have been proposed. These tools either implicitly or explicitly
    are built on Link Congestion Effect (LCE): if source host sends probe packets at
    a rate $x$ that is higher than available-bw, there must be at least one
    link that forwards the probe packets at a rate lower than $x$ @zhuo2006.

    // LCE makes four basic assumptions.
    // 1. All routers apply first-in-first-out (FIFO) queues.
    // 2. Cross-traffic follows a fluid model: cross traffic packets have an
    //   infinitely small packet size.
    // 3. The rate of cross-traffic changes slowly, and is constant for the
    //   duration of one estimation instance.
    // 4. End-host is able to transmit probe packets at a rate higher than
    //   available-bw.

    We may assume that the path a packet takes from end hosts is stable for
    some period of time, as observed by Paxson et al in @mills1995. Moreover, it was
    found that path throughput remains constant for extended periods of time by
    Zhang et al in @zhang2001. Thus, we can expect experiments to provide consistent
    measurements for extended periods of time.

    Tools such as pathload use one-way delay measurements to estimate the available-bw.
    However, the tool relies on LCE. Our main goal is to obtain this estimate without
    generating congestion in any links, by simply observing the average one-way delays
    and the minimum one-way delay.

    #figure(caption: [
    ])[
      #img-placeholder(width: 90%, height: 200pt, label: "Placeholder")
    ]
  ]

  // These properties will be given to the function which is responsible for creating the heading
  #let hba = pop.uni-fr.heading-box-args
  #hba.insert("stroke", (paint: gradient.linear(green, red, blue), thickness: 10pt))

  // and these are for the body.
  #let bba = pop.uni-fr.body-box-args
  #bba.insert("inset", 30pt)
  #bba.insert("stroke", (paint: gradient.linear(green, red, blue), thickness: 10pt))

  // #pop.column-box(heading: "Peace of Posters Documentation")[
  //   #text(fill: red)[
  //     #link("https://jonaspleyer.github.io/peace-of-posters/")[
  //       jonaspleyer.github.io/peace-of-posters/
  //     ]
  //   ].
  // ]


  #pop.column-box(heading: "Background")[
    A network path $cal(P)$ is a sequence of $n$ store-and-forward links that
    trasfer packets from the source host $cal(R)_0$ to a destination host
    $cal(R)_n$ through a set of intermediate routers $cal(R)_1, ..., cal(R)_(n-1)$. Link
    $L_i$ is the data connection from $cal(R)_i$ to $cal(R)_(i+1)$. At any time, $L_i$ is
    either idle or forwarding packets at its capacity $C_i$. The end-to-end
    capacity $C$ is defined as
    $
      C equiv min_(i = 0,..., n) C_i
    $
    and it is the maximum rate that the path can provide to a flow, when no
    traffic is present in $cal(P)$. The available-bw of this link is then
    defined as the unused bandwidth over a time interval $tau$:
    $
      A_i (t, t+tau) colon.eq 1/tau integral_t^(t+tau) (C_i - lambda_i (t)) d t,
    $
    where $lambda_i$ is the rate of cross-traffic in $L_i$. In particular, the
    _available-bw_ that we estimate is the path available-bw. That is, the
    minimum link available-bw of the target path:
    $
      A(t, t+tau) := min_(i = 0, ..., n) A_i (t, t+tau)
    $
    The link that mantains the minimum link available-bw is named the
    bottleneck link.
    #figure(caption: [
    ])[
      #img-placeholder(width: 90%, height: 200pt, label: "Placeholder")
    ]
    The One-Way Delay (OWD) is the amount of 

  ]

  #colbreak()

  #pop.column-box(heading: "Related Work")[
    #lorem(90)
    #figure(caption: [
    ])[
      #img-placeholder(width: 90%, height: 200pt, label: "Placeholder")
    ]
  ]

  #pop.column-box(heading: "Current Findings and Results")[
    #lorem(90) 
    #lorem(20)
    #figure(caption: [
    ])[
      #img-placeholder(width: 90%, height: 400pt, label: "Placeholder")
    ]
  ]

  #pop.column-box()[
    #bibliography("bibliography.bib")
  ]

])
