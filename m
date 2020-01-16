Return-Path: <netem-bounces@lists.linux-foundation.org>
X-Original-To: lists.netem@lfdr.de
Delivered-To: lists.netem@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 770A8145F16
	for <lists.netem@lfdr.de>; Thu, 23 Jan 2020 00:23:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 19D6988275;
	Wed, 22 Jan 2020 23:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tVQuA18RxpXt; Wed, 22 Jan 2020 23:23:17 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id DB11A8805D;
	Wed, 22 Jan 2020 23:23:12 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BCF73C18DD;
	Wed, 22 Jan 2020 23:23:12 +0000 (UTC)
X-Original-To: netem@lists.linux-foundation.org
Delivered-To: netem@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E6BB4C077D
 for <netem@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:13:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id E344886BA8
 for <netem@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:13:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0H8o61bqJXIE for <netem@lists.linux-foundation.org>;
 Thu, 16 Jan 2020 17:13:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by whitealder.osuosl.org (Postfix) with ESMTPS id AFE7686B92
 for <netem@lists.linux-foundation.org>; Thu, 16 Jan 2020 17:13:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 70C672469A;
 Thu, 16 Jan 2020 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194785;
 bh=vVBgfAgrUKbiJfJ+p2gwwtvtOIeZjbHCGsOwRk3w3v8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=0DP01mDaPqUKEw9+e+mRDmyE6xKMcA06ktmrz4UKejyIa2yw7OdtmVy2qgx+oJReW
 UYTxeYo+DW2eqNvLne/2GbiUWwHX0zdJ9ZAS6SpKKsgSgZwqv+dF1smliFz2Zm0dTa
 l2udGtPgqH5ynPUWD434Q7/Hpda3BqXOO48lNNzk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:03:58 -0500
Message-Id: <20200116170509.12787-337-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Approved-At: Wed, 22 Jan 2020 23:23:06 +0000
Cc: Sasha Levin <sashal@kernel.org>,
 Jakub Kicinski <jakub.kicinski@netronome.com>,
 kbuild test robot <lkp@intel.com>, Simon Horman <simon.horman@netronome.com>,
 netem@lists.linux-foundation.org, netdev@vger.kernel.org,
 Ben Hutchings <ben@decadent.org.uk>, "David S . Miller" <davem@davemloft.net>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [Netem] [PATCH AUTOSEL 4.19 600/671] net: netem: fix error path for
	corrupted GSO frames
X-BeenThere: netem@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: netem-bounces@lists.linux-foundation.org
Sender: "Netem" <netem-bounces@lists.linux-foundation.org>

From: Jakub Kicinski <jakub.kicinski@netronome.com>

[ Upstream commit a7fa12d15855904aff1716e1fc723c03ba38c5cc ]

To corrupt a GSO frame we first perform segmentation.  We then
proceed using the first segment instead of the full GSO skb and
requeue the rest of the segments as separate packets.

If there are any issues with processing the first segment we
still want to process the rest, therefore we jump to the
finish_segs label.

Commit 177b8007463c ("net: netem: fix backlog accounting for
corrupted GSO frames") started using the pointer to the first
segment in the "rest of segments processing", but as mentioned
above the first segment may had already been freed at this point.

Backlog corrections for parent qdiscs have to be adjusted.

Fixes: 177b8007463c ("net: netem: fix backlog accounting for corrupted GSO frames")
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Reported-by: Ben Hutchings <ben@decadent.org.uk>
Signed-off-by: Jakub Kicinski <jakub.kicinski@netronome.com>
Reviewed-by: Simon Horman <simon.horman@netronome.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/sched/sch_netem.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
index 1cd7266140e6..7660aa5b80da 100644
--- a/net/sched/sch_netem.c
+++ b/net/sched/sch_netem.c
@@ -509,6 +509,7 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 		if (skb->ip_summed == CHECKSUM_PARTIAL &&
 		    skb_checksum_help(skb)) {
 			qdisc_drop(skb, sch, to_free);
+			skb = NULL;
 			goto finish_segs;
 		}
 
@@ -584,9 +585,10 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 finish_segs:
 	if (segs) {
 		unsigned int len, last_len;
-		int nb = 0;
+		int nb;
 
-		len = skb->len;
+		len = skb ? skb->len : 0;
+		nb = skb ? 1 : 0;
 
 		while (segs) {
 			skb2 = segs->next;
@@ -603,7 +605,8 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch,
 			}
 			segs = skb2;
 		}
-		qdisc_tree_reduce_backlog(sch, -nb, prev_len - len);
+		/* Parent qdiscs accounted for 1 skb of size @prev_len */
+		qdisc_tree_reduce_backlog(sch, -(nb - 1), -(len - prev_len));
 	}
 	return NET_XMIT_SUCCESS;
 }
-- 
2.20.1

_______________________________________________
Netem mailing list
Netem@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/netem
