Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB444A728
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:38:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 633A6D67;
	Tue, 18 Jun 2019 16:38:15 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id A3275165A
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 00:16:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id F16FBE5
	for <netem@lists.linux-foundation.org>;
	Sat, 15 Jun 2019 00:16:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id x2so4578150qtr.0
	for <netem@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 17:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netronome-com.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:cc:subject:message-id:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=w3pSTczYmlQYVSM92CrJcpWHRfnWAGfJ8OCkSA5Kx88=;
	b=qxvLQ9pWnUIL94mH4KgeM1wP5/2zUlO+7DYpIVwd4NJ3zASfK8uDT+vEGjkQnmenww
	2Kx7aTVWivrIl4cI5B4/HLeJnxs18WtxMbSRYTOl/z8/kcvcu9tCt99Snx2Uc82wuSdQ
	kbKLBV4yOd2o0kvg1O9D/sg8tZAZbosgXYHwrhGQEAVu/idAOqsLX+sRJ/UHQJQKH5Wd
	6lISN3QF5s9XGEj547VglRzVmvG9AoupDAcdiMzZfdPFMT0Q/o7aNAvzmBvwwi1jc95g
	2foOeN+y0AaBeokN0mXVNvvfFcBUGsHLCGRsszL45CiKBmSgEndETyjLIarQdZHM1Fwm
	8cfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=w3pSTczYmlQYVSM92CrJcpWHRfnWAGfJ8OCkSA5Kx88=;
	b=KueChLyM9BOVlLV9J+TPw6sPESg71ZxL2BbMJPqd0bKAC9F2kIczHvkkjow/iZarz+
	24uFNwpqkMGVZVfufI93w0oM8sZlwyu0VL1NqxzVpBbHHliZZI81w3BDo/FHluAtD280
	S7d8ozbnhlbVaUk1xSvce81ZqApRg+rcJRKkijYd6b1vF7m0knxc9ceXRfkkOraemEHY
	pB1Io2W6eXtBAGSWAPfg9UzhOALVwi/2udO7Uv7vF0PMfjMqS2bkAIGb/UQAS4DnPPSu
	rxXHvrcBa/492Sp7DtAji6wlD2wJyYZ6t8qLlGDqS2c8KcZ9J9VE8anRRAHgmZhgYYYv
	ZsVQ==
X-Gm-Message-State: APjAAAVMv7u/FlsqMR+emmLqGTk3PTKpL0VnabMwndorG/4dNJrRdbHo
	gptDEMIr79sZcHdlfrdu3UtZ5A==
X-Google-Smtp-Source: APXvYqwq/PG9a9BdcRPU3iqAVp2S+pqeC5k/oLOaOPCV9pU4NAyTESLNTCOrNxJ3UK6EE4h5zKh6Yw==
X-Received: by 2002:ac8:2d08:: with SMTP id n8mr62108477qta.383.1560557809951; 
	Fri, 14 Jun 2019 17:16:49 -0700 (PDT)
Received: from cakuba.netronome.com ([66.60.152.14])
	by smtp.gmail.com with ESMTPSA id s44sm3252947qtc.8.2019.06.14.17.16.48
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 14 Jun 2019 17:16:49 -0700 (PDT)
Date: Fri, 14 Jun 2019 17:16:44 -0700
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: Cong Wang <xiyou.wangcong@gmail.com>
Message-ID: <20190614171644.766547d1@cakuba.netronome.com>
In-Reply-To: <CAM_iQpXoKnP+Xj0CMQf08nBCnbPEVu=uTbgCk98C380pYSUetA@mail.gmail.com>
References: <20190612185121.4175-1-jakub.kicinski@netronome.com>
	<CAM_iQpXoKnP+Xj0CMQf08nBCnbPEVu=uTbgCk98C380pYSUetA@mail.gmail.com>
Organization: Netronome Systems, Ltd.
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
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

On Fri, 14 Jun 2019 09:40:18 -0700, Cong Wang wrote:
> On Wed, Jun 12, 2019 at 11:52 AM Jakub Kicinski wrote:
> >
> > Brendan reports that the use of netem's packet corruption capability
> > leads to strange crashes.  This seems to be caused by
> > commit d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> > which uses skb->next pointer to construct a fast-path queue of
> > in-order skbs.
> >
> > Packet corruption code has to invoke skb_gso_segment() in case
> > of skbs in need of GSO.  skb_gso_segment() returns a list of
> > skbs.  If next pointers of the skbs on that list do not get cleared
> > fast path list goes into the weeds and tries to access the next
> > segment skb multiple times.  
> 
> Mind to be more specific? How could it be accessed multiple times?

You're right, the commit message is not great :S

So we segment an skb and get a list:

A -> B -> C

And then we hook in A to the t_head t_tail list:

h t
|/
A -> B -> C

Now if B and C get also get enqueued successfully all is fine, because
we will overwrite the list in order.  IOW:

h    t
|    |
A -> B -> C 

h         t
|         |
A -> B -> C 

But if B and C get reordered we may end up with

h t               RB
|/                |
A -> B -> C       B
                    \
                      C

Or if they get dropped (overlimits) just:

h t
|/
A -> B -> C

while A and B are already freed.

> > Reported-by: Brendan Galloway <brendan.galloway@netronome.com>
> > Fixes: d66280b12bd7 ("net: netem: use a list in addition to rbtree")
> > Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
> > Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
> > ---
> >  net/sched/sch_netem.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
> > index 956ff3da81f4..1fd4405611e5 100644
> > --- a/net/sched/sch_netem.c
> > +++ b/net/sched/sch_netem.c
> > @@ -494,16 +494,13 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
> >          */
> >         if (q->corrupt && q->corrupt >= get_crandom(&q->corrupt_cor)) {
> >                 if (skb_is_gso(skb)) {
> > -                       segs = netem_segment(skb, sch, to_free);
> > -                       if (!segs)
> > +                       skb = netem_segment(skb, sch, to_free);
> > +                       if (!skb)
> >                                 return rc_drop;
> > -               } else {
> > -                       segs = skb;
> > +                       segs = skb->next;
> > +                       skb_mark_not_on_list(skb);
> >                 }
> >
> > -               skb = segs;
> > -               segs = segs->next;
> > -  
> 
> I don't see how this works when we hit goto finish_segs?
> Either goto finish_segs can be removed or needs to be fixed?

Note that I'm removing the else branch.  So for non-GSO we end up with:

	skb = original
	segs = NULL

for GSO we end up with:

	skb = first seg (->next == NULL)
	segs = second seg (->next == third, etc.)

So should work all as is?
_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
