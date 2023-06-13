Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Original-To: lists+linux-tegra@lfdr.de
Delivered-To: lists+linux-tegra@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57D2372E151
	for <lists+linux-tegra@lfdr.de>; Tue, 13 Jun 2023 13:22:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241226AbjFMLVt (ORCPT <rfc822;lists+linux-tegra@lfdr.de>);
        Tue, 13 Jun 2023 07:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240922AbjFMLVh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 13 Jun 2023 07:21:37 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2729610EC
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 04:21:25 -0700 (PDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230613111503euoutp012aa6d110454dfaa0695b17052dc79012~oM7LpJGFM3122031220euoutp01Y
        for <linux-tegra@vger.kernel.org>; Tue, 13 Jun 2023 11:15:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230613111503euoutp012aa6d110454dfaa0695b17052dc79012~oM7LpJGFM3122031220euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1686654903;
        bh=8MNqKmFBmNPNbL2L39V5adtMllTU04IWiRfgO6kTSoY=;
        h=Date:From:Subject:To:Cc:In-Reply-To:References:From;
        b=Sc1ihiwrLnmDOHfF61n1Plq81xkgGB1Tey91Z4N2taAyN0C4JNy22uM9gd9Q9abQb
         qOSnHHoexZC+XRwbzlgaPJY4kMe2fpkwx4wdrjZ7HDtjF76nTcSinVnANijNVxjp3w
         KqMyWLs2h62cjhSLISRZJLFX5i1qKEIXQZGvL83k=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230613111503eucas1p1cbe1b66e83e237b58f3a087e842dda04~oM7LCGyw-0675806758eucas1p1K;
        Tue, 13 Jun 2023 11:15:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E3.FA.42423.7BF48846; Tue, 13
        Jun 2023 12:15:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20230613111502eucas1p2644889c9de1abfe1a14a3b549772f247~oM7KfHuXo0268402684eucas1p2U;
        Tue, 13 Jun 2023 11:15:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230613111502eusmtrp25e1c0fdc110dac9f9919c39e919b5ff5~oM7KeP5tX0735307353eusmtrp2L;
        Tue, 13 Jun 2023 11:15:02 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-a0-64884fb7fd54
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 1C.88.14344.6BF48846; Tue, 13
        Jun 2023 12:15:02 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20230613111501eusmtip1d12c9c1424af1c1780034808e376f4d9~oM7Jqb4px2387323873eusmtip1Y;
        Tue, 13 Jun 2023 11:15:01 +0000 (GMT)
Message-ID: <b8d0272d-0193-fe40-3294-9e32a0235323@samsung.com>
Date:   Tue, 13 Jun 2023 13:15:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.11.2
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4 03/68] clk: Move no reparent case into a separate
 function
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-actions@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Content-Language: en-US
In-Reply-To: <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPKsWRmVeSWpSXmKPExsWy7djP87rb/TtSDBbN47a48vU9m8WqqTtZ
        LKY9aWKx2PT4GqvFx557rBZdv1YyW3Ru2spoMWHVNxaLrS/fMVkcW32FzaLr2hNWiyn7drFZ
        dH6ZxWYx48c/RouLp1wt/l3byOIg4PH+Riu7x51z59k8Nq3qZPO4332cyWPzknqPF5tnMnps
        fLeDyaP/r4HHwX2GHp83yQVwRXHZpKTmZJalFunbJXBl/JnwjLmgy6hi55MpbA2M7zS7GDk4
        JARMJJbcUe1i5OQQEljBKLF7m1YXIxeQ/QXI/n2LFcL5zCjR/mMmM0zDqRVREPHljBJ77r1g
        gXA+MkqsmP2NDWQUr4CdxLunrYwgNouAqsT8r6eh4oISJ2c+YQGxRQVSJXZfO8AKYrMJGEp0
        ve0CqxEWCJa4dPIIWFxEoFTi37OpYAuYBY4yS5y8cpsZJMEsIC5x68l8JhCbU8BbYufzu4wQ
        cXmJ5q2zmUEaJAT2c0qsev4VrEhCwEXi3fG9ULawxKvjW9ghbBmJ/ztBBoE0tDNKLPh9H8qZ
        wCjR8PwWI0SVtcSdc7/YQAHALKApsX6XPkTYUeLEt2XQcOGTuPFWEOIIPolJ26ZDhXklOtqE
        IKrVJGYdXwe39uCFS8wTGJVmIYXLLCSvzULyziyEvQsYWVYxiqeWFuempxYb5qWW6xUn5haX
        5qXrJefnbmIEpsHT/45/2sE499VHvUOMTByMhxglOJiVRHifarSnCPGmJFZWpRblxxeV5qQW
        H2KU5mBREufVtj2ZLCSQnliSmp2aWpBaBJNl4uCUamBSUvC5fNBm6THPE9Wfij5cux31vbCc
        1+fTh6xfLkWGdfPyv84589HV/0uDnoZwmKk6484L7Efn+3q4ZPixLLr8Nt9Ca7a02NUvvR07
        rNe9k3qh/ffdQgOxhXd3vq47x8u23GaS04OVOf010ucLpqadeTzvXtgEjWnGM+78Lp6u/2R6
        0XoHjmuXl1SYJE4t6Sq6+LCfqawwa80StaP8rDVfL5zbU/Powpc175P2X+mZ6POKdcPd2+9W
        vuqdbNn4zW3fLhFrtjJR5tpPxX8+dbS18Ql9Fvu2/bBjdcuN2f2fM8x8V+Y9jvkXwu4W9fGZ
        W26mmphmc1v31INprySV3RccOzL7+918Xe4HFXKq+yv6lViKMxINtZiLihMBwRVW/vIDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsVy+t/xu7rb/DtSDHZvU7G48vU9m8WqqTtZ
        LKY9aWKx2PT4GqvFx557rBZdv1YyW3Ru2spoMWHVNxaLrS/fMVkcW32FzaLr2hNWiyn7drFZ
        dH6ZxWYx48c/RouLp1wt/l3byOIg4PH+Riu7x51z59k8Nq3qZPO4332cyWPzknqPF5tnMnps
        fLeDyaP/r4HHwX2GHp83yQVwRenZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hkam8daGZkq
        6dvZpKTmZJalFunbJehl/JnwjLmgy6hi55MpbA2M7zS7GDk4JARMJE6tiOpi5OIQEljKKNG8
        fhFTFyMnUFxG4uS0BlYIW1jiz7UuNoii94wSh5p2ghXxCthJvHvayghiswioSsz/epoNIi4o
        cXLmExYQW1QgVeLukn6wOJuAoUTX2y4wW1ggWOLSySNgC0QESiU+b93JArKAWeAos8TPkwsZ
        IbZ1M0rMPNwO1sEsIC5x68l8sM2cAt4SO5/fZYSIm0l0be2CsuUlmrfOZp7AKDQLySGzkLTP
        QtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGxv+3Yzy07GFe++qh3iJGJg/EQ
        owQHs5II71ON9hQh3pTEyqrUovz4otKc1OJDjKbA0JjILCWanA9MPnkl8YZmBqaGJmaWBqaW
        ZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUwmGsZp9memBT/W5njD0DTV9eDmqEsaB9JV
        e8TvLzzw0iqrf+XHjR7u977Gmncc3CR2j/W+V+tTn+TOplyjBf8654kf+nK29Z0Kq29Ez9wd
        JYwCgoy9lzZ3/rMuF3TVjXXb4nBcSHr6zwsvMwU3vnxgzWzzrfHiH74KbQZP+4Mzt5879Ofx
        mX0n7zZeLv4vxaLC6TjhXPo84ykHCjW8N77u/KEewbzrZFi23NkV798k9y1+MnVz98xNVfJ7
        PaafV16yw9u1TkDx0P9sTcV1PD4zjafs3sXQU5/o18E1ef4c75PmIqopU0rump1n0Ti2/dX/
        veJzrKuPrt2y6L6/ufKhmrTEL5Fz4vvusTR1PVijxFKckWioxVxUnAgAahRV9oYDAAA=
X-CMS-MailID: 20230613111502eucas1p2644889c9de1abfe1a14a3b549772f247
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230613111502eucas1p2644889c9de1abfe1a14a3b549772f247
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230613111502eucas1p2644889c9de1abfe1a14a3b549772f247
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
        <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
        <CGME20230613111502eucas1p2644889c9de1abfe1a14a3b549772f247@eucas1p2.samsung.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 05.05.2023 13:25, Maxime Ripard wrote:
> From: Stephen Boyd <sboyd@kernel.org>
>
> We'll need to turn the code in clk_mux_determine_rate_flags() to deal
> with CLK_SET_RATE_NO_REPARENT into a helper clock drivers will be able
> to use if they don't want to allow reparenting.
>
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Alessandro Zummo <a.zummo@towertech.it>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: "Andreas Färber" <afaerber@suse.de>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Chen-Yu Tsai <wenst@chromium.org>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: David Lechner <david@lechnology.com>
> Cc: Dinh Nguyen <dinguyen@kernel.org>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Miles Chen <miles.chen@mediatek.com>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Cc: Paul Cercueil <paul@crapouillou.net>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Sekhar Nori <nsekhar@ti.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Takashi Iwai <tiwai@suse.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-actions@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mips@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rtc@vger.kernel.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Cc: linux-sunxi@lists.linux.dev
> Cc: linux-tegra@vger.kernel.org
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Cc: patches@opensource.cirrus.com
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---

This patch landed in today's linux-next as commit 1b4e99fda73f ("clk: 
Move no reparent case into a separate function"). Unfortunately it 
causes serious regression of some of my test boards. Namely Exynos3250 
based boards are so slow after it, that my test scripts fail with a 
timeout waiting for them to finish booting. I will try to debug this 
later in the evening to check what has happened that some clocks got 
very low rate.


> drivers/clk/clk.c | 75 
> +++++++++++++++++++++++++++++++------------------------
> 1 file changed, 43 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index e495dd7a1eae..f57f821a5e5a 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -594,6 +594,46 @@ clk_core_forward_rate_req(struct clk_core *core,
> req->max_rate = old_req->max_rate;
> }
> +static int
> +clk_core_determine_rate_no_reparent(struct clk_hw *hw,
> + struct clk_rate_request *req)
> +{
> + struct clk_core *core = hw->core;
> + struct clk_core *parent = core->parent;
> + unsigned long best;
> + int ret;
> +
> + if (core->flags & CLK_SET_RATE_PARENT) {
> + struct clk_rate_request parent_req;
> +
> + if (!parent) {
> + req->rate = 0;
> + return 0;
> + }
> +
> + clk_core_forward_rate_req(core, req, parent, &parent_req,
> + req->rate);
> +
> + trace_clk_rate_request_start(&parent_req);
> +
> + ret = clk_core_round_rate_nolock(parent, &parent_req);
> + if (ret)
> + return ret;
> +
> + trace_clk_rate_request_done(&parent_req);
> +
> + best = parent_req.rate;
> + } else if (parent) {
> + best = clk_core_get_rate_nolock(parent);
> + } else {
> + best = clk_core_get_rate_nolock(core);
> + }
> +
> + req->rate = best;
> +
> + return 0;
> +}
> +
> int clk_mux_determine_rate_flags(struct clk_hw *hw,
> struct clk_rate_request *req,
> unsigned long flags)
> @@ -603,35 +643,8 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> unsigned long best = 0;
> /* if NO_REPARENT flag set, pass through to current parent */
> - if (core->flags & CLK_SET_RATE_NO_REPARENT) {
> - parent = core->parent;
> - if (core->flags & CLK_SET_RATE_PARENT) {
> - struct clk_rate_request parent_req;
> -
> - if (!parent) {
> - req->rate = 0;
> - return 0;
> - }
> -
> - clk_core_forward_rate_req(core, req, parent, &parent_req, req->rate);
> -
> - trace_clk_rate_request_start(&parent_req);
> -
> - ret = clk_core_round_rate_nolock(parent, &parent_req);
> - if (ret)
> - return ret;
> -
> - trace_clk_rate_request_done(&parent_req);
> -
> - best = parent_req.rate;
> - } else if (parent) {
> - best = clk_core_get_rate_nolock(parent);
> - } else {
> - best = clk_core_get_rate_nolock(core);
> - }
> -
> - goto out;
> - }
> + if (core->flags & CLK_SET_RATE_NO_REPARENT)
> + return clk_core_determine_rate_no_reparent(hw, req);
> /* find the parent that can provide the fastest rate <= rate */
> num_parents = core->num_parents;
> @@ -670,9 +683,7 @@ int clk_mux_determine_rate_flags(struct clk_hw *hw,
> if (!best_parent)
> return -EINVAL;
> -out:
> - if (best_parent)
> - req->best_parent_hw = best_parent->hw;
> + req->best_parent_hw = best_parent->hw;
> req->best_parent_rate = best;
> req->rate = best;
>
Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

