Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B459827F09B
	for <lists+linux-tegra@lfdr.de>; Wed, 30 Sep 2020 19:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725823AbgI3Rep (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Wed, 30 Sep 2020 13:34:45 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:29809 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgI3Rep (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 13:34:45 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4C1k0M5vrGz6R;
        Wed, 30 Sep 2020 19:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601487284; bh=MN8lFR//QgRpimjyUq48atVSm9u5I81XroQCcweQiHY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kJzM0i5fUyBnV+x92SF2lmMSEIo/AOd+qQztIo9bnHT8p/Fa92d7Vw018H2gUE6lF
         NsCj543U+XXKHHGbA6qFw1FEV+D9maSobBpl+LJAfHX0LqqKJZVieqQD3i4L6rsMcs
         aErHjE4extRAyZt1uc0N+rJWHie49rVx8D5c2815F/psihvCN4igHqqssqC/9kPKKF
         nHkf6Kf615lPG1gh1jtF5QrAHgE7D2u1+lVPC2DY14YAfep0bXNY6vOfX1aKeZMu+X
         n/WFPKMyTgnnBH1xzoUbbxL6DXvSACd+mGXc6lAo/SM93HlG65vsRrSb3gtVTveuoQ
         KdgnxSJiTzVYA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Wed, 30 Sep 2020 19:34:42 +0200
From:   =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, hverkuil@xs4all.nl,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 2/2] media: tegra-video: Allow building driver with
 COMPILE_TEST
Message-ID: <20200930173442.GC12964@qmqm.qmqm.pl>
References: <1601434958-29305-1-git-send-email-skomatineni@nvidia.com>
 <1601434958-29305-3-git-send-email-skomatineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1601434958-29305-3-git-send-email-skomatineni@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 29, 2020 at 08:02:38PM -0700, Sowjanya Komatineni wrote:
> This patch adds COMPILE_TEST option to Kconfig to allow building
> it with COMPILE_TEST option.

Does it build without TEGRA_HOST1X selected? Isn't the previous patch
enough to allow the build with COMPILE_TEST?

Best Regards,
Micha� Miros�aw
