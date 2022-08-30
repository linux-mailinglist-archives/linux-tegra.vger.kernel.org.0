Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF1395A5CF2
	for <lists+linux-tegra@lfdr.de>; Tue, 30 Aug 2022 09:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231163AbiH3Hbq (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 30 Aug 2022 03:31:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbiH3HbW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Aug 2022 03:31:22 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE44B7EE7
        for <linux-tegra@vger.kernel.org>; Tue, 30 Aug 2022 00:30:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1E07DB815D2
        for <linux-tegra@vger.kernel.org>; Tue, 30 Aug 2022 07:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62140C433D6;
        Tue, 30 Aug 2022 07:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661844643;
        bh=yxaD30kiK8sn86tWcBr0/VotZNzimgXDeGSr6pKwkP4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XUatUZcBjOih6PU1OM6mlpdFMMzM+DZHiclqrUJ/eeHpkcvMLLvFU/UwadK0smemN
         AbK7CVuFaGOTP/01iNoL5PE9692oI6jEPb0s+tDY/kA+Hq6BajStKM7jB2b5SAjb83
         UA+CM5uOAIkBpnkVO/BgLcjX76O2yN9YDlRqvjIccUGUcmVpq1DRbClDVtQbeenPiS
         o+4vSODpJJUq1BwUT9ANhYvKuB3LXQMW7PW+d9a31f7sfaKoHb1RconLriQ8o4QNWq
         ZXZhp7eyilNzd9MCp1XuEdxQ5WEDN3WgOgv3KSNSbZZmkK4G2aCTPi0anaPnUrbd6X
         G3cJztijV6yWQ==
Date:   Tue, 30 Aug 2022 13:00:40 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-phy@lists.infradead.org, linux-tegra@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] phy: tegra: xusb: Only warn once reset problems in
 .remove()
Message-ID: <Yw28oH9eGOEhzw9J@matsya>
References: <20220716145403.107703-1-u.kleine-koenig@pengutronix.de>
 <20220718075300.u6yxlwebwnh6gymi@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220718075300.u6yxlwebwnh6gymi@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 18-07-22, 09:53, Uwe Kleine-König wrote:
> Hello,
> 
> $Subject ~= s/once reset/once about reset/
> 
> . Should I resend, or can you fixup when applying this patch? (Assuming
> you're otherwise happy with the change of course.)

Applied with updated subject :)

-- 
~Vinod
