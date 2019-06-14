Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD114A726
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:38:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 32BF2CC6;
	Tue, 18 Jun 2019 16:38:12 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5B3E0156D
	for <netem@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 16:40:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43D79E5
	for <netem@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 16:40:31 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id t7so1229536plr.11
	for <netem@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 09:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IX90swC7hftdPTwLwP0qHVUYL7Fmqz1424fsCkB1o+c=;
	b=Cm/IFGaNgy0caHy/mW8NywZ1gdQyhTyUwuCO9nV1q9W3kH/492BFsctKCRSvXLS2S4
	B16cjJ/KGpC9Hhmqjbg4a8difj+MRnX9CwaQb8pVZOrUlpOfLIBWlkhFhrXosoQ+76T/
	izBcn1XV3EtbNdZoJA0cQ5RwEwBt1qcH6mt6+GqHBSyqUjmg+crSuwOj3fulVI5Hvwzz
	0H/4R9TCkAX11H12qbzZWgXJiZipGhCR55B0ih8jtR6fdJIELoosrjvyjdQLraNX9VJS
	oB/QvcZtjpxWtyWKkhpO8Pb2ytJj53JDaqMw0I37CF4y5d8xRLp9lzYaJgcgPW2bOyBj
	6rmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IX90swC7hftdPTwLwP0qHVUYL7Fmqz1424fsCkB1o+c=;
	b=Gkf8IjQnV2SbnBh+UXY4JjQCcvPTqxtroEnIn4W+9YKbXDV2KlIVhbV8j7Y/s0xJPw
	PzzdIxMdolTMocpdETXBJ0RMKRVw0PA0O3MtGT+asWb3x9RwdFgsyyYGj+ED4a78NkEn
	QpifWNuXkgh9b35uzvIYIDzELOv7WYp+xVQV90z1xscOVdSGDGzQu3nymtNEAEBTZbTz
	duiWENPAo76/iKLSuMG5em8CGXp2hGcLDxtNo4+n6al2dt+Zk0wFFWo4D9fIWOcIGFxF
	8o3/E1levCiTXOwOAsxsubtHV1vAmw4mDxsUMSCfTtiFFhQieXxZOcM3B7cfJjchoH6e
	4p1g==
X-Gm-Message-State: APjAAAVqgy2L9/qV9YZLa0DY/tUOQ1X1ZvdOhaWrPiH6/NcQqp7Py1iM
	b+DACAAdQME1r5gcJIVnJg2uvSt4N8TQVpaZcCs=
X-Google-Smtp-Source: APXvYqzB9nq144eVvKQuSzykNI79XgdNfSCoBLQ1Inx4t7HgAIEDXpRfeNVvfKuSKiULek/8ZtgOTdK2Ce9VVyCTdZI=
X-Received: by 2002:a17:902:5c2:: with SMTP id
	f60mr93714889plf.61.1560530430772; 
	Fri, 14 Jun 2019 09:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190612185121.4175-1-jakub.kicinski@netronome.com>
In-Reply-To: <20190612185121.4175-1-jakub.kicinski@netronome.com>
From: Cong Wang <xiyou.wangcong@gmail.com>
Date: Fri, 14 Jun 2019 09:40:18 -0700
Message-ID: <CAM_iQpXoKnP+Xj0CMQf08nBCnbPEVu=uTbgCk98C380pYSUetA@mail.gmail.com>
To: Jakub Kicinski <jakub.kicinski@netronome.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: Jiri Pirko <jiri@resnulli.us>, oss-drivers@netronome.com,
	Linux Kernel Network Developers <netdev@vger.kernel.org>,
	netem@lists.linux-foundation.org, Jamal Hadi Salim <jhs@mojatatu.com>,
	Stephen Hemminger <stephen@networkplumber.org>,
	Eric Dumazet <edumazet@google.com>, posk@google.com,
	David Miller <davem@davemloft.net>
Subject: Re: [Netem] [PATCH net] net: netem: fix use after free and double
 free with packet corruption
X-BeenThere: netem@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux network emulator <netem.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/netem>,
	<mailto:netem-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/netem/>
List-Post: <mailto:netem@lists.linux-foundation.org>
List-Help: <mailto:netem-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/netem>,
	<mailto:netem-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: netem-bounces@lists.linux-foundation.org
Errors-To: netem-bounces@lists.linux-foundation.org

On Wed, Jun 12, 2019 at 11:52 AM Jakub Kicinski
<jakub.kicinski@netronome.com> wrote:
>
> Brendan reports that the use of netem's packet corruption capability
> leads to strange crashes.  This seems to be caused by
> commit d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> which uses skb->next pointer to construct a fast-path queue of
> in-order skbs.
>
> Packet corruption code has to invoke skb_gso_segment() in case
> of skbs in need of GSO.  skb_gso_segment() returns a list of
> skbs.  If next pointers of the skbs on that list do not get cleared
> fast path list goes into the weeds and tries to access the next
> segment skb multiple times.

Mind to be more specific? How could it be accessed multiple times?

>
> Reported-by: Brendan Galloway <brendan.galloway@netronome.com>
> Fixes: d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
> ---
>  net/sched/sch_netem.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
>
> diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> index 956ff3da81f4..1fd4405611e5 100644
> --- a/net/sched/sch_netem.c
> +++ b/net/sched/sch_netem.c
> @@ -494,16 +494,13 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
>          */
>         if (q->corrupt && q->corrupt >= get_crandom(&q->corrupt_cor)) {
>                 if (skb_is_gso(skb)) {
> -                       segs = netem_segment(skb, sch, to_free);
> -                       if (!segs)
> +                       skb = netem_segment(skb, sch, to_free);
> +                       if (!skb)
>                                 return rc_drop;
> -               } else {
> -                       segs = skb;
> +                       segs = skb->next;
> +                       skb_mark_not_on_list(skb);
>                 }
>
> -               skb = segs;
> -               segs = segs->next;
> -

I don't see how this works when we hit goto finish_segs?
Either goto finish_segs can be removed or needs to be fixed?

Thanks.
_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
