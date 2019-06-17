Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C814A72F
	for <lists.netem@lfdr.de>; Tue, 18 Jun 2019 18:39:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 6F124DDE;
	Tue, 18 Jun 2019 16:38:24 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E5455E1C
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 18:11:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 67D0A828
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 18:11:33 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id x47so11845251qtk.11
	for <netem@lists.linux-foundation.org>;
	Mon, 17 Jun 2019 11:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netronome-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=OLcMrwIGxGfiBP59PlNzaCCXz7xv1kWBjQx2oRR1Rhc=;
	b=C0szVlzbpe3g6UOW22Ys3sdL1YQZda+KO6tcAtJ51fW0+Vi47i+7m58sc98NFcyysd
	f9ayG5/X6RHkhUasWuFNslLXr/nRQdQGJdlKRItXUpaWYju05QXrC/2YrtkL41jTsFTl
	y4JF29Tj142wrhuaagHUib51rtHu3DXYcjaoL40XtCMaRVUkYG0JnuFI5L+gfxUxEUnj
	yND2w8N2HPydbWvZgqjj3I1+mL6ddieFMoNJ0mEAVa6nVNRqtDP6RhmgL/HtwfIoLJJ4
	IYy1Hv46PGybG0RMe7e02rvY99lTHZozTuD/sgNWtrzuj1IrAWTm7PguTtbDF7NUDxqg
	FjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OLcMrwIGxGfiBP59PlNzaCCXz7xv1kWBjQx2oRR1Rhc=;
	b=pgjHE1RR8ImZNT0I+/oN9pF3OVPOSc+6qQk4sZxv3BI9ZW93b1X6CqCloj9UJjrEVh
	CvY/Vu3uKCGWAmngLvavmAuzotCKlfTw0/mVmeESERtFCb/FYEzDWwMC1mEraR+asEnQ
	VIPDvlGpTqaRNxptVxBsElA2lvuEcneoU+FxcU0qwMEdrHq+BzLTDW7KJs4lgkyLegYG
	rnihPsVbmyFsKlRez/6bRmZpEbnAih4FggPfnZ/t0NKf/72+Dj0MZSDOh1hPIGGfcGT7
	w1eqRNb45flhlkMA0bdOADvpnfwBQxIZuOh0a2PdO5zcBVHaLBx8yRLFE3SDwta2qnUF
	rCJQ==
X-Gm-Message-State: APjAAAXMTsEIpjgRLRmWR7J2iOz7hEAVFmQS17IJrKLFiWWHYl4HibqC
	RAyb57By2GiQWvKOF96G6IR4lA==
X-Google-Smtp-Source: APXvYqzD0Ja6so/a+AZf+grGMi9cjkQzrrVtQwPPUetv+lpori5bW/JG1nikeF+yai65Z2WlhDA+dA==
X-Received: by 2002:a0c:adef:: with SMTP id x44mr22810137qvc.153.1560795092607;
	Mon, 17 Jun 2019 11:11:32 -0700 (PDT)
Received: from jkicinski-Precision-T1700.netronome.com ([66.60.152.14])
	by smtp.gmail.com with ESMTPSA id
	x10sm9048564qtc.34.2019.06.17.11.11.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jun 2019 11:11:32 -0700 (PDT)
From: Jakub Kicinski <jakub.kicinski@netronome.com>
To: davem@davemloft.net,
	xiyou.wangcong@gmail.com
Date: Mon, 17 Jun 2019 11:11:10 -0700
Message-Id: <20190617181111.5025-2-jakub.kicinski@netronome.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190617181111.5025-1-jakub.kicinski@netronome.com>
References: <20190617181111.5025-1-jakub.kicinski@netronome.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Tue, 18 Jun 2019 16:38:03 +0000
Cc: jiri@resnulli.us, nhorman@tuxdriver.com, oss-drivers@netronome.com,
	netdev@vger.kernel.org, netem@lists.linux-foundation.org,
	jhs@mojatatu.com, stephen@networkplumber.org,
	edumazet@google.com, posk@google.com
Subject: [Netem] [PATCH net v2 1/2] net: netem: fix backlog accounting for
	corrupted GSO frames
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

When GSO frame has to be corrupted netem uses skb_gso_segment()
to produce the list of frames, and re-enqueues the segments one
by one.  The backlog length has to be adjusted to account for
new frames.

The current calculation is incorrect, leading to wrong backlog
lengths in the parent qdisc (both bytes and packets), and
incorrect packet backlog count in netem itself.

Parent backlog goes negative, netem's packet backlog counts
all non-first segments twice (thus remaining non-zero even
after qdisc is emptied).

Move the variables used to count the adjustment into local
scope to make 100% sure they aren't used at any stage in
backports.

Fixes: 6071bd1aa13e ("netem: Segment GSO packets on enqueue")
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Reviewed-by: Dirk van der Merwe <dirk.vandermerwe@netronome.com>
---
 net/sched/sch_netem.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 956ff3da81f4..3b3e2d772c3b 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -439,8 +439,7 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 	struct netem_skb_cb *cb;
 	struct sk_buff *skb2;
 	struct sk_buff *segs = NULL;
-	unsigned int len = 0, last_len, prev_len = qdisc_pkt_len(skb);
-	int nb = 0;
+	unsigned int prev_len = qdisc_pkt_len(skb);
 	int count = 1;
 	int rc = NET_XMIT_SUCCESS;
 	int rc_drop = NET_XMIT_DROP;
@@ -497,6 +496,7 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			segs = netem_segment(skb, sch, to_free);
 			if (!segs)
 				return rc_drop;
+			qdisc_skb_cb(segs)->pkt_len = segs->len;
 		} else {
 			segs = skb;
 		}
@@ -593,6 +593,11 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 
 finish_segs:
 	if (segs) {
+		unsigned int len, last_len;
+		int nb = 0;
+
+		len = skb->len;
+
 		while (segs) {
 			skb2 = segs->next;
 			skb_mark_not_on_list(segs);
@@ -608,9 +613,7 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			}
 			segs = skb2;
 		}
-		sch->q.qlen += nb;
-		if (nb > 1)
-			qdisc_tree_reduce_backlog(sch, 1 - nb, prev_len - len);
+		qdisc_tree_reduce_backlog(sch, -nb, prev_len - len);
 	}
 	return NET_XMIT_SUCCESS;
 }
-- 
2.21.0

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
