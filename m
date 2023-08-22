Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD0DB784E51
	for <lists+linux-tegra@lfdr.de>; Wed, 23 Aug 2023 03:41:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232030AbjHWBlR (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 22 Aug 2023 21:41:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbjHWBlQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 22 Aug 2023 21:41:16 -0400
X-Greylist: delayed 903 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 22 Aug 2023 18:41:14 PDT
Received: from symantec4.comsats.net.pk (symantec4.comsats.net.pk [203.124.41.30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F04E4C
        for <linux-tegra@vger.kernel.org>; Tue, 22 Aug 2023 18:41:13 -0700 (PDT)
X-AuditID: cb7c291e-06dff70000002aeb-51-64e54b4aaff9
Received: from iesco.comsatshosting.com (iesco.comsatshosting.com [210.56.28.11])
        (using TLS with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        by symantec4.comsats.net.pk (Symantec Messaging Gateway) with SMTP id 29.6B.10987.A4B45E46; Wed, 23 Aug 2023 04:56:59 +0500 (PKT)
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns;
        d=iesco.com.pk; s=default;
        h=received:content-type:mime-version:content-transfer-encoding
          :content-description:subject:to:from:date:reply-to;
        b=gHF2w1OQWksRObt0TEJQ5UzvejA+AsrzTZBhcs/n+cpA2Kgm1gopGPmwm9NdxABpD
          BsOPLBtVA5EwXIJwT5pV7qLu9fB8Ox9cQCXNveyYDe8DAghASzeZeBrKzuIqDdXHl
          jlOUiAFLthDkLQEChnwoxQcBFysD38pUGef/ca8qQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iesco.com.pk; s=default;
        h=reply-to:date:from:to:subject:content-description
          :content-transfer-encoding:mime-version:content-type;
        bh=GMzYzcyTxDsE6wX/XHG6MHqAdAiHrhqbmmLQ/TZ1QnQ=;
        b=kL50LBYTvvcQe3bztW1SA1tKEnQZt70bwvvldqi3uua8VLbIlwH117c8lbM+/qbe1
          0UcZd5PPZK4MxkRexRSRv6FXBTRYFbsd1uBFOB6sdKM22Lhrz5WrG3jL22gFuvfUS
          ZgS7ZwjKp3/RmNOIpg+qltPaYhXhdk/IUxdPujEK8=
Received: from [94.156.6.90] (UnknownHost [94.156.6.90]) by iesco.comsatshosting.com with SMTP;
   Wed, 23 Aug 2023 04:31:08 +0500
Message-ID: <29.6B.10987.A4B45E46@symantec4.comsats.net.pk>
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re; Interest,
To:     linux-tegra@vger.kernel.org
From:   "Chen Yun" <pso.chairmanbod@iesco.com.pk>
Date:   Tue, 22 Aug 2023 16:31:22 -0700
Reply-To: chnyne@gmail.com
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNLMWRmVeSWpSXmKPExsVyyUKGW9fb+2mKwe6/7BadX2axOTB6fN4k
        F8AYxWWTkpqTWZZapG+XwJWxZN0FloLdzBVt/YtYGhgfM3UxcnJICJhI/Dl2m7mLkYtDSGAP
        k8TKyVeYQBwWgdXMEguvXGAGqWIReMgs0f/VHaKqmVGi+8QjsASvgLXEjj8v2EFsZgE9iRtT
        p7BBxAUlTs58wgIR15ZYtvA1UD0HkK0m8bWrBCQsLCAm8WnaMnaQsIiAvERHeyBImE1AX2LF
        12ZGiLWqElNON4AdKiQgJbHxynq2CYz8s5Asm4Vk2Swky2YhLFvAyLKKUaK4MjcRGGjJJnrJ
        +bnFiSXFenmpJXoF2ZsYgUF4ukZTbgfj0kuJhxgFOBiVeHh/rnuSIsSaWAbUdYhRgoNZSYRX
        +vvDFCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8tkLPkoUE0hNLUrNTUwtSi2CyTBycUg2MQjts
        pt2+/eowC3fUSr2da0OYFk+6/MXr+WvLQywPH4ZfvHHqZstyfzuzFwGsPzurxJ1LzpxRusUV
        Xcjg/uXVkrnM7bytyS+nvCuNnfgvsG/71cOecvvCJx561OhjfNtFbL1y4KJL27Rnz3TcL/PJ
        Qpz3Y5fsSduz8r9dXiXZSWwW79GdvSbCRYmlOCPRUIu5qDgRAHRzzWo+AgAA
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_REPLYTO,
        RCVD_IN_DNSWL_LOW,RCVD_IN_SBL,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: *  0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was
        *      blocked.  See
        *      http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
        *      for more information.
        *      [URIs: iesco.com.pk]
        * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/,
        *       low trust
        *      [203.124.41.30 listed in list.dnswl.org]
        *  3.3 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
        *      [94.156.6.90 listed in zen.spamhaus.org]
        *  0.1 RCVD_IN_SBL RBL: Received via a relay in Spamhaus SBL
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  2.1 FREEMAIL_FORGED_REPLYTO Freemail in Reply-To, but not From
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Re; Interest,

I am interested in discussing the Investment proposal as I explained
in my previous mail. May you let me know your interest and the
possibility of a cooperation aimed for mutual interest.

Looking forward to your mail for further discussion.

Regards

------
Chen Yun - Chairman of CREC
China Railway Engineering Corporation - CRECG
China Railway Plaza, No.69 Fuxing Road, Haidian District, Beijing, P.R.
China

